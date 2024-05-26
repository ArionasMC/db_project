Ακολουθούμε τον οδηγό της MySQL (https://dev.mysql.com/doc/dev/mysql-server/latest/PAGE_OPT_TRACE.html, https://dev.mysql.com/doc/refman/8.0/en/using-explain.html).

# 3.6

Χωρίς index:

```
mysql> SET SESSION OPTIMIZER_TRACE="enabled=on";
mysql> EXPLAIN SELECT LEAST(rhl1.label_name, rhl2.label_name) AS label_name1, GREATEST(rhl1.label_name, rhl2.label_name) AS label_name2, count(*) as appearances FROM recipe_has_label rhl1 USE INDEX () INNER JOIN recipe_has_label rhl2 USE INDEX () ON (rhl2.recipe_name = rhl1.recipe_name AND rhl2.recipe_cuisine_name = rhl1.recipe_cuisine_name AND rhl1.label_name <> rhl2.label_name) GROUP BY label_name1, label_name2 ORDER BY appearances DESC limit 3;
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+--------------------------------------------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra                                      |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+--------------------------------------------+
|  1 | SIMPLE      | rhl1  | NULL       | ALL  | NULL          | NULL | NULL    | NULL |  211 |   100.00 | Using temporary; Using filesort            |
|  1 | SIMPLE      | rhl2  | NULL       | ALL  | NULL          | NULL | NULL    | NULL |  211 |     0.47 | Using where; Using join buffer (hash join) |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+--------------------------------------------+
2 rows in set, 1 warning (0.00 sec)
```

Trace (`SELECT TRACE FROM information_schema.OPTIMIZER_TRACE limit 1;`):

```json
{
  "steps": [
    {
      "join_preparation": {
        "select#": 1,
        "steps": [
          {
            "expanded_query": "/* select#1 */ select least(`rhl1`.`label_name`,`rhl2`.`label_name`) AS `label_name1`,greatest(`rhl1`.`label_name`,`rhl2`.`label_name`) AS `label_name2`,count(0) AS `appearances` from (`recipe_has_label` `rhl1` USE INDEX () join `recipe_has_label` `rhl2` USE INDEX () on(((`rhl2`.`recipe_name` = `rhl1`.`recipe_name`) and (`rhl2`.`recipe_cuisine_name` = `rhl1`.`recipe_cuisine_name`) and (`rhl1`.`label_name` <> `rhl2`.`label_name`)))) group by `label_name1`,`label_name2` order by `appearances` desc limit 3"
          },
          {
            "transformations_to_nested_joins": {
              "transformations": [
                "JOIN_condition_to_WHERE",
                "parenthesis_removal"
              ],
              "expanded_query": "/* select#1 */ select least(`rhl1`.`label_name`,`rhl2`.`label_name`) AS `label_name1`,greatest(`rhl1`.`label_name`,`rhl2`.`label_name`) AS `label_name2`,count(0) AS `appearances` from `recipe_has_label` `rhl1` USE INDEX () join `recipe_has_label` `rhl2` USE INDEX () where ((`rhl2`.`recipe_name` = `rhl1`.`recipe_name`) and (`rhl2`.`recipe_cuisine_name` = `rhl1`.`recipe_cuisine_name`) and (`rhl1`.`label_name` <> `rhl2`.`label_name`)) group by `label_name1`,`label_name2` order by `appearances` desc limit 3"
            }
          }
        ]
      }
    },
    {
      "join_optimization": {
        "select#": 1,
        "steps": [
          {
            "condition_processing": {
              "condition": "WHERE",
              "original_condition": "((`rhl2`.`recipe_name` = `rhl1`.`recipe_name`) and (`rhl2`.`recipe_cuisine_name` = `rhl1`.`recipe_cuisine_name`) and (`rhl1`.`label_name` <> `rhl2`.`label_name`))",
              "steps": [
                {
                  "transformation": "equality_propagation",
                  "resulting_condition": "((`rhl1`.`label_name` <> `rhl2`.`label_name`) and multiple equal(`rhl2`.`recipe_name`, `rhl1`.`recipe_name`) and multiple equal(`rhl2`.`recipe_cuisine_name`, `rhl1`.`recipe_cuisine_name`))"
                },
                {
                  "transformation": "constant_propagation",
                  "resulting_condition": "((`rhl1`.`label_name` <> `rhl2`.`label_name`) and multiple equal(`rhl2`.`recipe_name`, `rhl1`.`recipe_name`) and multiple equal(`rhl2`.`recipe_cuisine_name`, `rhl1`.`recipe_cuisine_name`))"
                },
                {
                  "transformation": "trivial_condition_removal",
                  "resulting_condition": "((`rhl1`.`label_name` <> `rhl2`.`label_name`) and multiple equal(`rhl2`.`recipe_name`, `rhl1`.`recipe_name`) and multiple equal(`rhl2`.`recipe_cuisine_name`, `rhl1`.`recipe_cuisine_name`))"
                }
              ]
            }
          },
          {
            "substitute_generated_columns": {
            }
          },
          {
            "table_dependencies": [
              {
                "table": "`recipe_has_label` `rhl1` USE INDEX ()",
                "row_may_be_null": false,
                "map_bit": 0,
                "depends_on_map_bits": [
                ]
              },
              {
                "table": "`recipe_has_label` `rhl2` USE INDEX ()",
                "row_may_be_null": false,
                "map_bit": 1,
                "depends_on_map_bits": [
                ]
              }
            ]
          },
          {
            "ref_optimizer_key_uses": [
            ]
          },
          {
            "rows_estimation": [
              {
                "table": "`recipe_has_label` `rhl1` USE INDEX ()",
                "table_scan": {
                  "rows": 211,
                  "cost": 0.25
                }
              },
              {
                "table": "`recipe_has_label` `rhl2` USE INDEX ()",
                "table_scan": {
                  "rows": 211,
                  "cost": 0.25
                }
              }
            ]
          },
          {
            "considered_execution_plans": [
              {
                "plan_prefix": [
                ],
                "table": "`recipe_has_label` `rhl1` USE INDEX ()",
                "best_access_path": {
                  "considered_access_paths": [
                    {
                      "rows_to_scan": 211,
                      "filtering_effect": [
                      ],
                      "final_filtering_effect": 1,
                      "access_type": "scan",
                      "resulting_rows": 211,
                      "cost": 21.35,
                      "chosen": true
                    }
                  ]
                },
                "condition_filtering_pct": 100,
                "rows_for_plan": 211,
                "cost_for_plan": 21.35,
                "rest_of_plan": [
                  {
                    "plan_prefix": [
                      "`recipe_has_label` `rhl1` USE INDEX ()"
                    ],
                    "table": "`recipe_has_label` `rhl2` USE INDEX ()",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "rows_to_scan": 211,
                          "filtering_effect": [
                          ],
                          "final_filtering_effect": 1,
                          "access_type": "scan",
                          "using_join_cache": true,
                          "buffers_needed": 1,
                          "resulting_rows": 211,
                          "cost": 4452.52,
                          "chosen": true
                        }
                      ]
                    },
                    "condition_filtering_pct": 0.473934,
                    "rows_for_plan": 211,
                    "cost_for_plan": 4473.87,
                    "chosen": true
                  }
                ]
              },
              {
                "plan_prefix": [
                ],
                "table": "`recipe_has_label` `rhl2` USE INDEX ()",
                "best_access_path": {
                  "considered_access_paths": [
                    {
                      "rows_to_scan": 211,
                      "filtering_effect": [
                      ],
                      "final_filtering_effect": 1,
                      "access_type": "scan",
                      "resulting_rows": 211,
                      "cost": 21.35,
                      "chosen": true
                    }
                  ]
                },
                "condition_filtering_pct": 100,
                "rows_for_plan": 211,
                "cost_for_plan": 21.35,
                "rest_of_plan": [
                  {
                    "plan_prefix": [
                      "`recipe_has_label` `rhl2` USE INDEX ()"
                    ],
                    "table": "`recipe_has_label` `rhl1` USE INDEX ()",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "rows_to_scan": 211,
                          "filtering_effect": [
                          ],
                          "final_filtering_effect": 1,
                          "access_type": "scan",
                          "using_join_cache": true,
                          "buffers_needed": 1,
                          "resulting_rows": 211,
                          "cost": 4452.52,
                          "chosen": true
                        }
                      ]
                    },
                    "condition_filtering_pct": 0.473934,
                    "rows_for_plan": 211,
                    "cost_for_plan": 4473.87,
                    "pruned_by_cost": true
                  }
                ]
              }
            ]
          },
          {
            "attaching_conditions_to_tables": {
              "original_condition": "((`rhl2`.`recipe_cuisine_name` = `rhl1`.`recipe_cuisine_name`) and (`rhl2`.`recipe_name` = `rhl1`.`recipe_name`) and (`rhl1`.`label_name` <> `rhl2`.`label_name`))",
              "attached_conditions_computation": [
              ],
              "attached_conditions_summary": [
                {
                  "table": "`recipe_has_label` `rhl1` USE INDEX ()",
                  "attached": null
                },
                {
                  "table": "`recipe_has_label` `rhl2` USE INDEX ()",
                  "attached": "((`rhl2`.`recipe_cuisine_name` = `rhl1`.`recipe_cuisine_name`) and (`rhl2`.`recipe_name` = `rhl1`.`recipe_name`) and (`rhl1`.`label_name` <> `rhl2`.`label_name`))"
                }
              ]
            }
          },
          {
            "optimizing_distinct_group_by_order_by": {
              "simplifying_order_by": {
                "original_clause": "`appearances` desc",
                "items": [
                  {
                    "item": "count(0)"
                  }
                ],
                "resulting_clause_is_simple": false,
                "resulting_clause": "`appearances` desc"
              },
              "simplifying_group_by": {
                "original_clause": "`label_name1`,`label_name2`",
                "items": [
                  {
                    "item": "least(`rhl1`.`label_name`,`rhl2`.`label_name`)"
                  },
                  {
                    "item": "greatest(`rhl1`.`label_name`,`rhl2`.`label_name`)"
                  }
                ],
                "resulting_clause_is_simple": false,
                "resulting_clause": "`label_name1`,`label_name2`"
              }
            }
          },
          {
            "finalizing_table_conditions": [
              {
                "table": "`recipe_has_label` `rhl2` USE INDEX ()",
                "original_table_condition": "((`rhl2`.`recipe_cuisine_name` = `rhl1`.`recipe_cuisine_name`) and (`rhl2`.`recipe_name` = `rhl1`.`recipe_name`) and (`rhl1`.`label_name` <> `rhl2`.`label_name`))",
                "final_table_condition   ": "((`rhl2`.`recipe_cuisine_name` = `rhl1`.`recipe_cuisine_name`) and (`rhl2`.`recipe_name` = `rhl1`.`recipe_name`) and (`rhl1`.`label_name` <> `rhl2`.`label_name`))"
              }
            ]
          },
          {
            "refine_plan": [
              {
                "table": "`recipe_has_label` `rhl1` USE INDEX ()"
              },
              {
                "table": "`recipe_has_label` `rhl2` USE INDEX ()"
              }
            ]
          },
          {
            "considering_tmp_tables": [
              {
                "adding_tmp_table_in_plan_at_position": 2,
                "write_method": "continuously_update_group_row"
              },
              {
                "adding_sort_to_table": ""
              }
            ]
          }
        ]
      }
    },
    {
      "join_explain": {
        "select#": 1,
        "steps": [
        ]
      }
    }
  ]
}
```

Με index:

```
mysql> EXPLAIN SELECT LEAST(rhl1.label_name, rhl2.label_name) AS label_name1, GREATEST(rhl1.label_name, rhl2.label_name) AS label_name2, count(*) as appearances FROM recipe_has_label rhl1 INNER JOIN recipe_has_label rhl2 ON (rhl2.recipe_name = rhl1.recipe_name AND rhl2.recipe_cuisine_name = rhl1.recipe_cuisine_name AND rhl1.label_name <> rhl2.label_name) GROUP BY label_name1, label_name2 ORDER BY appearances DESC limit 3;
+----+-------------+-------+------------+-------+-----------------------------------------+---------------------------------+---------+-----------------------------------------------------+------+----------+----------------------------------------------+
| id | select_type | table | partitions | type  | possible_keys                           | key                             | key_len | ref                                                 | rows | filtered | Extra                                        |
+----+-------------+-------+------------+-------+-----------------------------------------+---------------------------------+---------+-----------------------------------------------------+------+----------+----------------------------------------------+
|  1 | SIMPLE      | rhl1  | NULL       | index | PRIMARY,fk_recipe_has_label_recipe1_idx | fk_recipe_has_label_recipe1_idx | 772     | NULL                                                |  211 |   100.00 | Using index; Using temporary; Using filesort |
|  1 | SIMPLE      | rhl2  | NULL       | ref   | PRIMARY,fk_recipe_has_label_recipe1_idx | PRIMARY                         | 772     | mydb.rhl1.recipe_name,mydb.rhl1.recipe_cuisine_name |    2 |    90.00 | Using where; Using index                     |
+----+-------------+-------+------------+-------+-----------------------------------------+---------------------------------+---------+-----------------------------------------------------+------+----------+----------------------------------------------+
2 rows in set, 1 warning (0.00 sec)
```

Trace (`SELECT TRACE FROM information_schema.OPTIMIZER_TRACE limit 1;`):

```json
{
  "steps": [
    {
      "join_preparation": {
        "select#": 1,
        "steps": [
          {
            "expanded_query": "/* select#1 */ select least(`rhl1`.`label_name`,`rhl2`.`label_name`) AS `label_name1`,greatest(`rhl1`.`label_name`,`rhl2`.`label_name`) AS `label_name2`,count(0) AS `appearances` from (`recipe_has_label` `rhl1` join `recipe_has_label` `rhl2` on(((`rhl2`.`recipe_name` = `rhl1`.`recipe_name`) and (`rhl2`.`recipe_cuisine_name` = `rhl1`.`recipe_cuisine_name`) and (`rhl1`.`label_name` <> `rhl2`.`label_name`)))) group by `label_name1`,`label_name2` order by `appearances` desc limit 3"
          },
          {
            "transformations_to_nested_joins": {
              "transformations": [
                "JOIN_condition_to_WHERE",
                "parenthesis_removal"
              ],
              "expanded_query": "/* select#1 */ select least(`rhl1`.`label_name`,`rhl2`.`label_name`) AS `label_name1`,greatest(`rhl1`.`label_name`,`rhl2`.`label_name`) AS `label_name2`,count(0) AS `appearances` from `recipe_has_label` `rhl1` join `recipe_has_label` `rhl2` where ((`rhl2`.`recipe_name` = `rhl1`.`recipe_name`) and (`rhl2`.`recipe_cuisine_name` = `rhl1`.`recipe_cuisine_name`) and (`rhl1`.`label_name` <> `rhl2`.`label_name`)) group by `label_name1`,`label_name2` order by `appearances` desc limit 3"
            }
          }
        ]
      }
    },
    {
      "join_optimization": {
        "select#": 1,
        "steps": [
          {
            "condition_processing": {
              "condition": "WHERE",
              "original_condition": "((`rhl2`.`recipe_name` = `rhl1`.`recipe_name`) and (`rhl2`.`recipe_cuisine_name` = `rhl1`.`recipe_cuisine_name`) and (`rhl1`.`label_name` <> `rhl2`.`label_name`))",
              "steps": [
                {
                  "transformation": "equality_propagation",
                  "resulting_condition": "((`rhl1`.`label_name` <> `rhl2`.`label_name`) and multiple equal(`rhl2`.`recipe_name`, `rhl1`.`recipe_name`) and multiple equal(`rhl2`.`recipe_cuisine_name`, `rhl1`.`recipe_cuisine_name`))"
                },
                {
                  "transformation": "constant_propagation",
                  "resulting_condition": "((`rhl1`.`label_name` <> `rhl2`.`label_name`) and multiple equal(`rhl2`.`recipe_name`, `rhl1`.`recipe_name`) and multiple equal(`rhl2`.`recipe_cuisine_name`, `rhl1`.`recipe_cuisine_name`))"
                },
                {
                  "transformation": "trivial_condition_removal",
                  "resulting_condition": "((`rhl1`.`label_name` <> `rhl2`.`label_name`) and multiple equal(`rhl2`.`recipe_name`, `rhl1`.`recipe_name`) and multiple equal(`rhl2`.`recipe_cuisine_name`, `rhl1`.`recipe_cuisine_name`))"
                }
              ]
            }
          },
          {
            "substitute_generated_columns": {
            }
          },
          {
            "table_dependencies": [
              {
                "table": "`recipe_has_label` `rhl1`",
                "row_may_be_null": false,
                "map_bit": 0,
                "depends_on_map_bits": [
                ]
              },
              {
                "table": "`recipe_has_label` `rhl2`",
                "row_may_be_null": false,
                "map_bit": 1,
                "depends_on_map_bits": [
                ]
              }
            ]
          },
          {
            "ref_optimizer_key_uses": [
              {
                "table": "`recipe_has_label` `rhl1`",
                "field": "recipe_name",
                "equals": "`rhl2`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_label` `rhl1`",
                "field": "recipe_cuisine_name",
                "equals": "`rhl2`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_label` `rhl1`",
                "field": "recipe_name",
                "equals": "`rhl2`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_label` `rhl1`",
                "field": "recipe_cuisine_name",
                "equals": "`rhl2`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_label` `rhl2`",
                "field": "recipe_name",
                "equals": "`rhl1`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_label` `rhl2`",
                "field": "recipe_cuisine_name",
                "equals": "`rhl1`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_label` `rhl2`",
                "field": "recipe_name",
                "equals": "`rhl1`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_label` `rhl2`",
                "field": "recipe_cuisine_name",
                "equals": "`rhl1`.`recipe_cuisine_name`",
                "null_rejecting": true
              }
            ]
          },
          {
            "rows_estimation": [
              {
                "table": "`recipe_has_label` `rhl1`",
                "table_scan": {
                  "rows": 211,
                  "cost": 0.25
                }
              },
              {
                "table": "`recipe_has_label` `rhl2`",
                "table_scan": {
                  "rows": 211,
                  "cost": 0.25
                }
              }
            ]
          },
          {
            "considered_execution_plans": [
              {
                "plan_prefix": [
                ],
                "table": "`recipe_has_label` `rhl1`",
                "best_access_path": {
                  "considered_access_paths": [
                    {
                      "access_type": "ref",
                      "index": "PRIMARY",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "access_type": "ref",
                      "index": "fk_recipe_has_label_recipe1_idx",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "rows_to_scan": 211,
                      "filtering_effect": [
                      ],
                      "final_filtering_effect": 1,
                      "access_type": "scan",
                      "resulting_rows": 211,
                      "cost": 21.35,
                      "chosen": true
                    }
                  ]
                },
                "condition_filtering_pct": 100,
                "rows_for_plan": 211,
                "cost_for_plan": 21.35,
                "rest_of_plan": [
                  {
                    "plan_prefix": [
                      "`recipe_has_label` `rhl1`"
                    ],
                    "table": "`recipe_has_label` `rhl2`",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "access_type": "ref",
                          "index": "PRIMARY",
                          "rows": 2.39773,
                          "cost": 118.088,
                          "chosen": true
                        },
                        {
                          "access_type": "ref",
                          "index": "fk_recipe_has_label_recipe1_idx",
                          "rows": 2.39773,
                          "cost": 118.088,
                          "chosen": false
                        },
                        {
                          "access_type": "scan",
                          "chosen": false,
                          "cause": "covering_index_better_than_full_scan"
                        }
                      ]
                    },
                    "condition_filtering_pct": 90,
                    "rows_for_plan": 455.328,
                    "cost_for_plan": 139.438,
                    "chosen": true
                  }
                ]
              },
              {
                "plan_prefix": [
                ],
                "table": "`recipe_has_label` `rhl2`",
                "best_access_path": {
                  "considered_access_paths": [
                    {
                      "access_type": "ref",
                      "index": "PRIMARY",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "access_type": "ref",
                      "index": "fk_recipe_has_label_recipe1_idx",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "rows_to_scan": 211,
                      "filtering_effect": [
                      ],
                      "final_filtering_effect": 1,
                      "access_type": "scan",
                      "resulting_rows": 211,
                      "cost": 21.35,
                      "chosen": true
                    }
                  ]
                },
                "condition_filtering_pct": 100,
                "rows_for_plan": 211,
                "cost_for_plan": 21.35,
                "rest_of_plan": [
                  {
                    "plan_prefix": [
                      "`recipe_has_label` `rhl2`"
                    ],
                    "table": "`recipe_has_label` `rhl1`",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "access_type": "ref",
                          "index": "PRIMARY",
                          "rows": 2.39773,
                          "cost": 118.088,
                          "chosen": true
                        },
                        {
                          "access_type": "ref",
                          "index": "fk_recipe_has_label_recipe1_idx",
                          "rows": 2.39773,
                          "cost": 118.088,
                          "chosen": false
                        },
                        {
                          "access_type": "scan",
                          "chosen": false,
                          "cause": "covering_index_better_than_full_scan"
                        }
                      ]
                    },
                    "condition_filtering_pct": 90,
                    "rows_for_plan": 455.328,
                    "cost_for_plan": 139.438,
                    "pruned_by_cost": true
                  }
                ]
              }
            ]
          },
          {
            "attaching_conditions_to_tables": {
              "original_condition": "((`rhl2`.`recipe_cuisine_name` = `rhl1`.`recipe_cuisine_name`) and (`rhl2`.`recipe_name` = `rhl1`.`recipe_name`) and (`rhl1`.`label_name` <> `rhl2`.`label_name`))",
              "attached_conditions_computation": [
              ],
              "attached_conditions_summary": [
                {
                  "table": "`recipe_has_label` `rhl1`",
                  "attached": null
                },
                {
                  "table": "`recipe_has_label` `rhl2`",
                  "attached": "((`rhl2`.`recipe_cuisine_name` = `rhl1`.`recipe_cuisine_name`) and (`rhl2`.`recipe_name` = `rhl1`.`recipe_name`) and (`rhl1`.`label_name` <> `rhl2`.`label_name`))"
                }
              ]
            }
          },
          {
            "optimizing_distinct_group_by_order_by": {
              "simplifying_order_by": {
                "original_clause": "`appearances` desc",
                "items": [
                  {
                    "item": "count(0)"
                  }
                ],
                "resulting_clause_is_simple": false,
                "resulting_clause": "`appearances` desc"
              },
              "simplifying_group_by": {
                "original_clause": "`label_name1`,`label_name2`",
                "items": [
                  {
                    "item": "least(`rhl1`.`label_name`,`rhl2`.`label_name`)"
                  },
                  {
                    "item": "greatest(`rhl1`.`label_name`,`rhl2`.`label_name`)"
                  }
                ],
                "resulting_clause_is_simple": false,
                "resulting_clause": "`label_name1`,`label_name2`"
              }
            }
          },
          {
            "finalizing_table_conditions": [
              {
                "table": "`recipe_has_label` `rhl2`",
                "original_table_condition": "((`rhl2`.`recipe_cuisine_name` = `rhl1`.`recipe_cuisine_name`) and (`rhl2`.`recipe_name` = `rhl1`.`recipe_name`) and (`rhl1`.`label_name` <> `rhl2`.`label_name`))",
                "final_table_condition   ": "(`rhl1`.`label_name` <> `rhl2`.`label_name`)"
              }
            ]
          },
          {
            "refine_plan": [
              {
                "table": "`recipe_has_label` `rhl1`"
              },
              {
                "table": "`recipe_has_label` `rhl2`"
              }
            ]
          },
          {
            "considering_tmp_tables": [
              {
                "adding_tmp_table_in_plan_at_position": 2,
                "write_method": "continuously_update_group_row"
              },
              {
                "adding_sort_to_table": ""
              }
            ]
          }
        ]
      }
    },
    {
      "join_explain": {
        "select#": 1,
        "steps": [
        ]
      }
    }
  ]
}
```

Παρατηρούμε αλλαγές στα κόστη (δηλαδή στον αριθμό των στηλών που θα επεξεργαστούμε). Η σημαντικότερη διαφορά είναι στο πεδίο `ref_optimizer_key_uses`, που δείχνει ότι μπορούμε να έχουμε πρόσβαση στα rhl1, rhl2 (δηλαδή στο recipe_has_label) χρησιμοποιώντας το ίδιο index.

# 3.8

```
mysql> EXPLAIN SELECT ehr.episode_id, ehr.episode_year, count(*) as amount FROM episode_has_recipe ehr INNER JOIN recipe r ON (r.name = ehr.recipe_name AND r.cuisine_name = ehr.recipe_cuisine_name)         INNER JOIN recipe_has_equipment rhe ON (rhe.recipe_name = r.name AND rhe.recipe_cuisine_name = r.cuisine_name) GROUP BY ehr.episode_id, ehr.episode_year     ORDER BY amount DESC     limit 1;
+----+-------------+-------+------------+-------+--------------------------------------------------------------------------------------------------------------+-----------------------------------+---------+---------------------------------+------+----------+----------------------------------------------+
| id | select_type | table | partitions | type  | possible_keys                                                                                                | key                               | key_len | ref                             | rows | filtered | Extra                                        |
+----+-------------+-------+------------+-------+--------------------------------------------------------------------------------------------------------------+-----------------------------------+---------+---------------------------------+------+----------+----------------------------------------------+
|  1 | SIMPLE      | r     | NULL       | index | PRIMARY,fk_recipe_cuisine_idx                                                                                | fk_recipe_image1_idx              | 4       | NULL                            |   88 |   100.00 | Using index; Using temporary; Using filesort |
|  1 | SIMPLE      | rhe   | NULL       | ref   | PRIMARY,fk_recipe_has_equipment_recipe1_idx                                                                  | PRIMARY                           | 772     | mydb.r.name,mydb.r.cuisine_name |    3 |   100.00 | Using index                                  |
|  1 | SIMPLE      | ehr   | NULL       | ref   | PRIMARY,fk_episode_has_recipe_recipe1_idx,fk_episode_has_recipe_episode1_idx,fk_episode_has_recipe_chef1_idx | fk_episode_has_recipe_recipe1_idx | 772     | mydb.r.name,mydb.r.cuisine_name |    6 |   100.00 | Using index                                  |
+----+-------------+-------+------------+-------+--------------------------------------------------------------------------------------------------------------+-----------------------------------+---------+---------------------------------+------+----------+----------------------------------------------+
3 rows in set, 1 warning (0.00 sec)
```

Trace:

```json
{
  "steps": [
    {
      "join_preparation": {
        "select#": 1,
        "steps": [
          {
            "expanded_query": "/* select#1 */ select `ehr`.`episode_id` AS `episode_id`,`ehr`.`episode_year` AS `episode_year`,count(0) AS `amount` from ((`episode_has_recipe` `ehr` join `recipe` `r` on(((`r`.`name` = `ehr`.`recipe_name`) and (`r`.`cuisine_name` = `ehr`.`recipe_cuisine_name`)))) join `recipe_has_equipment` `rhe` on(((`rhe`.`recipe_name` = `r`.`name`) and (`rhe`.`recipe_cuisine_name` = `r`.`cuisine_name`)))) group by `ehr`.`episode_id`,`ehr`.`episode_year` order by `amount` desc limit 1"
          },
          {
            "transformations_to_nested_joins": {
              "transformations": [
                "JOIN_condition_to_WHERE",
                "parenthesis_removal"
              ],
              "expanded_query": "/* select#1 */ select `ehr`.`episode_id` AS `episode_id`,`ehr`.`episode_year` AS `episode_year`,count(0) AS `amount` from `episode_has_recipe` `ehr` join `recipe` `r` join `recipe_has_equipment` `rhe` where ((`rhe`.`recipe_name` = `r`.`name`) and (`rhe`.`recipe_cuisine_name` = `r`.`cuisine_name`) and (`r`.`name` = `ehr`.`recipe_name`) and (`r`.`cuisine_name` = `ehr`.`recipe_cuisine_name`)) group by `ehr`.`episode_id`,`ehr`.`episode_year` order by `amount` desc limit 1"
            }
          }
        ]
      }
    },
    {
      "join_optimization": {
        "select#": 1,
        "steps": [
          {
            "condition_processing": {
              "condition": "WHERE",
              "original_condition": "((`rhe`.`recipe_name` = `r`.`name`) and (`rhe`.`recipe_cuisine_name` = `r`.`cuisine_name`) and (`r`.`name` = `ehr`.`recipe_name`) and (`r`.`cuisine_name` = `ehr`.`recipe_cuisine_name`))",
              "steps": [
                {
                  "transformation": "equality_propagation",
                  "resulting_condition": "(multiple equal(`rhe`.`recipe_name`, `r`.`name`, `ehr`.`recipe_name`) and multiple equal(`rhe`.`recipe_cuisine_name`, `r`.`cuisine_name`, `ehr`.`recipe_cuisine_name`))"
                },
                {
                  "transformation": "constant_propagation",
                  "resulting_condition": "(multiple equal(`rhe`.`recipe_name`, `r`.`name`, `ehr`.`recipe_name`) and multiple equal(`rhe`.`recipe_cuisine_name`, `r`.`cuisine_name`, `ehr`.`recipe_cuisine_name`))"
                },
                {
                  "transformation": "trivial_condition_removal",
                  "resulting_condition": "(multiple equal(`rhe`.`recipe_name`, `r`.`name`, `ehr`.`recipe_name`) and multiple equal(`rhe`.`recipe_cuisine_name`, `r`.`cuisine_name`, `ehr`.`recipe_cuisine_name`))"
                }
              ]
            }
          },
          {
            "substitute_generated_columns": {
            }
          },
          {
            "table_dependencies": [
              {
                "table": "`episode_has_recipe` `ehr`",
                "row_may_be_null": false,
                "map_bit": 0,
                "depends_on_map_bits": [
                ]
              },
              {
                "table": "`recipe` `r`",
                "row_may_be_null": false,
                "map_bit": 1,
                "depends_on_map_bits": [
                ]
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "row_may_be_null": false,
                "map_bit": 2,
                "depends_on_map_bits": [
                ]
              }
            ]
          },
          {
            "ref_optimizer_key_uses": [
              {
                "table": "`episode_has_recipe` `ehr`",
                "field": "recipe_name",
                "equals": "`rhe`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`episode_has_recipe` `ehr`",
                "field": "recipe_name",
                "equals": "`r`.`name`",
                "null_rejecting": true
              },
              {
                "table": "`episode_has_recipe` `ehr`",
                "field": "recipe_cuisine_name",
                "equals": "`rhe`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`episode_has_recipe` `ehr`",
                "field": "recipe_cuisine_name",
                "equals": "`r`.`cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "name",
                "equals": "`rhe`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "name",
                "equals": "`ehr`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "cuisine_name",
                "equals": "`rhe`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "cuisine_name",
                "equals": "`ehr`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "cuisine_name",
                "equals": "`rhe`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "cuisine_name",
                "equals": "`ehr`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "name",
                "equals": "`rhe`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "name",
                "equals": "`ehr`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_name",
                "equals": "`r`.`name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_name",
                "equals": "`ehr`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_cuisine_name",
                "equals": "`r`.`cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_cuisine_name",
                "equals": "`ehr`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_name",
                "equals": "`r`.`name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_name",
                "equals": "`ehr`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_cuisine_name",
                "equals": "`r`.`cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_cuisine_name",
                "equals": "`ehr`.`recipe_cuisine_name`",
                "null_rejecting": true
              }
            ]
          },
          {
            "rows_estimation": [
              {
                "table": "`episode_has_recipe` `ehr`",
                "const_keys_added": {
                  "keys": [
                    "PRIMARY",
                    "fk_episode_has_recipe_recipe1_idx",
                    "fk_episode_has_recipe_episode1_idx",
                    "fk_episode_has_recipe_chef1_idx"
                  ],
                  "cause": "group_by"
                },
                "range_analysis": {
                  "table_scan": {
                    "rows": 500,
                    "cost": 55.1
                  },
                  "potential_range_indexes": [
                    {
                      "index": "PRIMARY",
                      "usable": true,
                      "key_parts": [
                        "episode_id",
                        "episode_year",
                        "recipe_name",
                        "recipe_cuisine_name",
                        "chef_id"
                      ]
                    },
                    {
                      "index": "fk_episode_has_recipe_recipe1_idx",
                      "usable": true,
                      "key_parts": [
                        "recipe_name",
                        "recipe_cuisine_name",
                        "episode_id",
                        "episode_year",
                        "chef_id"
                      ]
                    },
                    {
                      "index": "fk_episode_has_recipe_episode1_idx",
                      "usable": true,
                      "key_parts": [
                        "episode_id",
                        "episode_year",
                        "recipe_name",
                        "recipe_cuisine_name",
                        "chef_id"
                      ]
                    },
                    {
                      "index": "fk_episode_has_recipe_chef1_idx",
                      "usable": true,
                      "key_parts": [
                        "chef_id",
                        "episode_id",
                        "episode_year",
                        "recipe_name",
                        "recipe_cuisine_name"
                      ]
                    }
                  ],
                  "best_covering_index_scan": {
                    "index": "fk_episode_has_recipe_chef1_idx",
                    "cost": 96.3636,
                    "chosen": false,
                    "cause": "cost"
                  },
                  "setup_range_conditions": [
                  ],
                  "group_index_skip_scan": {
                    "chosen": false,
                    "cause": "not_single_table"
                  },
                  "skip_scan_range": {
                    "chosen": false,
                    "cause": "not_single_table"
                  }
                }
              },
              {
                "table": "`recipe` `r`",
                "table_scan": {
                  "rows": 88,
                  "cost": 3
                }
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "table_scan": {
                  "rows": 306,
                  "cost": 0.25
                }
              }
            ]
          },
          {
            "considered_execution_plans": [
              {
                "plan_prefix": [
                ],
                "table": "`recipe` `r`",
                "best_access_path": {
                  "considered_access_paths": [
                    {
                      "access_type": "ref",
                      "index": "PRIMARY",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "access_type": "ref",
                      "index": "fk_recipe_cuisine_idx",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "rows_to_scan": 88,
                      "filtering_effect": [
                      ],
                      "final_filtering_effect": 1,
                      "access_type": "scan",
                      "resulting_rows": 88,
                      "cost": 11.8,
                      "chosen": true
                    }
                  ]
                },
                "condition_filtering_pct": 100,
                "rows_for_plan": 88,
                "cost_for_plan": 11.8,
                "rest_of_plan": [
                  {
                    "plan_prefix": [
                      "`recipe` `r`"
                    ],
                    "table": "`recipe_has_equipment` `rhe`",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "access_type": "ref",
                          "index": "PRIMARY",
                          "rows": 3.47727,
                          "cost": 63.5,
                          "chosen": true
                        },
                        {
                          "access_type": "ref",
                          "index": "fk_recipe_has_equipment_recipe1_idx",
                          "rows": 3.47727,
                          "cost": 162.2,
                          "chosen": false
                        },
                        {
                          "access_type": "scan",
                          "chosen": false,
                          "cause": "covering_index_better_than_full_scan"
                        }
                      ]
                    },
                    "condition_filtering_pct": 100,
                    "rows_for_plan": 306,
                    "cost_for_plan": 75.3,
                    "rest_of_plan": [
                      {
                        "plan_prefix": [
                          "`recipe` `r`",
                          "`recipe_has_equipment` `rhe`"
                        ],
                        "table": "`episode_has_recipe` `ehr`",
                        "best_access_path": {
                          "considered_access_paths": [
                            {
                              "access_type": "ref",
                              "index": "fk_episode_has_recipe_recipe1_idx",
                              "rows": 6.09756,
                              "cost": 328.079,
                              "chosen": true
                            },
                            {
                              "access_type": "scan",
                              "chosen": false,
                              "cause": "covering_index_better_than_full_scan"
                            }
                          ]
                        },
                        "condition_filtering_pct": 100,
                        "rows_for_plan": 1865.85,
                        "cost_for_plan": 403.379,
                        "chosen": true
                      }
                    ]
                  },
                  {
                    "plan_prefix": [
                      "`recipe` `r`"
                    ],
                    "table": "`episode_has_recipe` `ehr`",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "access_type": "ref",
                          "index": "fk_episode_has_recipe_recipe1_idx",
                          "rows": 6.09756,
                          "cost": 94.3496,
                          "chosen": true
                        },
                        {
                          "access_type": "scan",
                          "chosen": false,
                          "cause": "covering_index_better_than_full_scan"
                        }
                      ]
                    },
                    "condition_filtering_pct": 100,
                    "rows_for_plan": 536.585,
                    "cost_for_plan": 106.15,
                    "rest_of_plan": [
                      {
                        "plan_prefix": [
                          "`recipe` `r`",
                          "`episode_has_recipe` `ehr`"
                        ],
                        "table": "`recipe_has_equipment` `rhe`",
                        "best_access_path": {
                          "considered_access_paths": [
                            {
                              "access_type": "ref",
                              "index": "PRIMARY",
                              "rows": 3.47727,
                              "cost": 387.195,
                              "chosen": true
                            },
                            {
                              "access_type": "ref",
                              "index": "fk_recipe_has_equipment_recipe1_idx",
                              "rows": 3.47727,
                              "cost": 989.024,
                              "chosen": false
                            },
                            {
                              "access_type": "scan",
                              "chosen": false,
                              "cause": "covering_index_better_than_full_scan"
                            }
                          ]
                        },
                        "condition_filtering_pct": 100,
                        "rows_for_plan": 1865.85,
                        "cost_for_plan": 493.345,
                        "pruned_by_cost": true
                      }
                    ]
                  }
                ]
              },
              {
                "plan_prefix": [
                ],
                "table": "`recipe_has_equipment` `rhe`",
                "best_access_path": {
                  "considered_access_paths": [
                    {
                      "access_type": "ref",
                      "index": "PRIMARY",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "access_type": "ref",
                      "index": "fk_recipe_has_equipment_recipe1_idx",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "rows_to_scan": 306,
                      "filtering_effect": [
                      ],
                      "final_filtering_effect": 1,
                      "access_type": "scan",
                      "resulting_rows": 306,
                      "cost": 30.85,
                      "chosen": true
                    }
                  ]
                },
                "condition_filtering_pct": 100,
                "rows_for_plan": 306,
                "cost_for_plan": 30.85,
                "rest_of_plan": [
                  {
                    "plan_prefix": [
                      "`recipe_has_equipment` `rhe`"
                    ],
                    "table": "`recipe` `r`",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "access_type": "eq_ref",
                          "index": "PRIMARY",
                          "rows": 1,
                          "cost": 336.6,
                          "chosen": true,
                          "cause": "clustered_pk_chosen_by_heuristics"
                        },
                        {
                          "access_type": "scan",
                          "chosen": false,
                          "cause": "covering_index_better_than_full_scan"
                        }
                      ]
                    },
                    "condition_filtering_pct": 100,
                    "rows_for_plan": 306,
                    "cost_for_plan": 367.45,
                    "rest_of_plan": [
                      {
                        "plan_prefix": [
                          "`recipe_has_equipment` `rhe`",
                          "`recipe` `r`"
                        ],
                        "table": "`episode_has_recipe` `ehr`",
                        "best_access_path": {
                          "considered_access_paths": [
                            {
                              "access_type": "ref",
                              "index": "fk_episode_has_recipe_recipe1_idx",
                              "rows": 6.09756,
                              "cost": 328.079,
                              "chosen": true
                            },
                            {
                              "access_type": "scan",
                              "chosen": false,
                              "cause": "covering_index_better_than_full_scan"
                            }
                          ]
                        },
                        "added_to_eq_ref_extension": false
                      },
                      {
                        "plan_prefix": [
                          "`recipe_has_equipment` `rhe`",
                          "`recipe` `r`"
                        ],
                        "table": "`episode_has_recipe` `ehr`",
                        "best_access_path": {
                          "considered_access_paths": [
                            {
                              "access_type": "ref",
                              "index": "fk_episode_has_recipe_recipe1_idx",
                              "rows": 6.09756,
                              "cost": 328.079,
                              "chosen": true
                            },
                            {
                              "access_type": "scan",
                              "chosen": false,
                              "cause": "covering_index_better_than_full_scan"
                            }
                          ]
                        },
                        "condition_filtering_pct": 100,
                        "rows_for_plan": 1865.85,
                        "cost_for_plan": 695.529,
                        "pruned_by_cost": true
                      }
                    ]
                  },
                  {
                    "plan_prefix": [
                      "`recipe_has_equipment` `rhe`"
                    ],
                    "table": "`episode_has_recipe` `ehr`",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "access_type": "ref",
                          "index": "fk_episode_has_recipe_recipe1_idx",
                          "rows": 6.09756,
                          "cost": 328.079,
                          "chosen": true
                        },
                        {
                          "access_type": "scan",
                          "chosen": false,
                          "cause": "covering_index_better_than_full_scan"
                        }
                      ]
                    },
                    "condition_filtering_pct": 100,
                    "rows_for_plan": 1865.85,
                    "cost_for_plan": 358.929,
                    "rest_of_plan": [
                      {
                        "plan_prefix": [
                          "`recipe_has_equipment` `rhe`",
                          "`episode_has_recipe` `ehr`"
                        ],
                        "table": "`recipe` `r`",
                        "best_access_path": {
                          "considered_access_paths": [
                            {
                              "access_type": "eq_ref",
                              "index": "PRIMARY",
                              "rows": 1,
                              "cost": 492.585,
                              "chosen": true,
                              "cause": "clustered_pk_chosen_by_heuristics"
                            },
                            {
                              "access_type": "scan",
                              "chosen": false,
                              "cause": "covering_index_better_than_full_scan"
                            }
                          ]
                        },
                        "condition_filtering_pct": 100,
                        "rows_for_plan": 1865.85,
                        "cost_for_plan": 851.515,
                        "pruned_by_cost": true
                      }
                    ]
                  }
                ]
              },
              {
                "plan_prefix": [
                ],
                "table": "`episode_has_recipe` `ehr`",
                "best_access_path": {
                  "considered_access_paths": [
                    {
                      "access_type": "ref",
                      "index": "fk_episode_has_recipe_recipe1_idx",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "rows_to_scan": 500,
                      "filtering_effect": [
                      ],
                      "final_filtering_effect": 1,
                      "access_type": "scan",
                      "resulting_rows": 500,
                      "cost": 53,
                      "chosen": true
                    }
                  ]
                },
                "condition_filtering_pct": 100,
                "rows_for_plan": 500,
                "cost_for_plan": 53,
                "rest_of_plan": [
                  {
                    "plan_prefix": [
                      "`episode_has_recipe` `ehr`"
                    ],
                    "table": "`recipe` `r`",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "access_type": "eq_ref",
                          "index": "PRIMARY",
                          "rows": 1,
                          "cost": 550,
                          "chosen": true,
                          "cause": "clustered_pk_chosen_by_heuristics"
                        },
                        {
                          "access_type": "scan",
                          "chosen": false,
                          "cause": "covering_index_better_than_full_scan"
                        }
                      ]
                    },
                    "condition_filtering_pct": 100,
                    "rows_for_plan": 500,
                    "cost_for_plan": 603,
                    "pruned_by_cost": true
                  },
                  {
                    "plan_prefix": [
                      "`episode_has_recipe` `ehr`"
                    ],
                    "table": "`recipe_has_equipment` `rhe`",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "access_type": "ref",
                          "index": "PRIMARY",
                          "rows": 3.47727,
                          "cost": 360.795,
                          "chosen": true
                        },
                        {
                          "access_type": "ref",
                          "index": "fk_recipe_has_equipment_recipe1_idx",
                          "rows": 3.47727,
                          "cost": 921.591,
                          "chosen": false
                        },
                        {
                          "access_type": "scan",
                          "chosen": false,
                          "cause": "covering_index_better_than_full_scan"
                        }
                      ]
                    },
                    "condition_filtering_pct": 100,
                    "rows_for_plan": 1738.64,
                    "cost_for_plan": 413.795,
                    "pruned_by_cost": true
                  }
                ]
              }
            ]
          },
          {
            "attaching_conditions_to_tables": {
              "original_condition": "((`rhe`.`recipe_cuisine_name` = `r`.`cuisine_name`) and (`ehr`.`recipe_cuisine_name` = `r`.`cuisine_name`) and (`rhe`.`recipe_name` = `r`.`name`) and (`ehr`.`recipe_name` = `r`.`name`))",
              "attached_conditions_computation": [
              ],
              "attached_conditions_summary": [
                {
                  "table": "`recipe` `r`",
                  "attached": null
                },
                {
                  "table": "`recipe_has_equipment` `rhe`",
                  "attached": "((`rhe`.`recipe_cuisine_name` = `r`.`cuisine_name`) and (`rhe`.`recipe_name` = `r`.`name`))"
                },
                {
                  "table": "`episode_has_recipe` `ehr`",
                  "attached": "((`ehr`.`recipe_cuisine_name` = `r`.`cuisine_name`) and (`ehr`.`recipe_name` = `r`.`name`))"
                }
              ]
            }
          },
          {
            "optimizing_distinct_group_by_order_by": {
              "simplifying_order_by": {
                "original_clause": "`amount` desc",
                "items": [
                  {
                    "item": "count(0)"
                  }
                ],
                "resulting_clause_is_simple": false,
                "resulting_clause": "`amount` desc"
              },
              "simplifying_group_by": {
                "original_clause": "`ehr`.`episode_id`,`ehr`.`episode_year`",
                "items": [
                  {
                    "item": "`ehr`.`episode_id`"
                  },
                  {
                    "item": "`ehr`.`episode_year`"
                  }
                ],
                "resulting_clause_is_simple": false,
                "resulting_clause": "`ehr`.`episode_id`,`ehr`.`episode_year`"
              }
            }
          },
          {
            "finalizing_table_conditions": [
              {
                "table": "`recipe_has_equipment` `rhe`",
                "original_table_condition": "((`rhe`.`recipe_cuisine_name` = `r`.`cuisine_name`) and (`rhe`.`recipe_name` = `r`.`name`))",
                "final_table_condition   ": null
              },
              {
                "table": "`episode_has_recipe` `ehr`",
                "original_table_condition": "((`ehr`.`recipe_cuisine_name` = `r`.`cuisine_name`) and (`ehr`.`recipe_name` = `r`.`name`))",
                "final_table_condition   ": null
              }
            ]
          },
          {
            "refine_plan": [
              {
                "table": "`recipe` `r`"
              },
              {
                "table": "`recipe_has_equipment` `rhe`"
              },
              {
                "table": "`episode_has_recipe` `ehr`"
              }
            ]
          },
          {
            "considering_tmp_tables": [
              {
                "adding_tmp_table_in_plan_at_position": 3,
                "write_method": "continuously_update_group_row"
              },
              {
                "adding_sort_to_table": ""
              }
            ]
          }
        ]
      }
    },
    {
      "join_explain": {
        "select#": 1,
        "steps": [
        ]
      }
    }
  ]
}
```


Αγνοώντας το `fk_episode_has_recipe_recipe1_idx` στο `episode_has_recipe`:

```
mysql> EXPLAIN SELECT ehr.episode_id, ehr.episode_year, count(*) as amount FROM episode_has_recipe ehr IGNORE INDEX (fk_episode_has_recipe_recipe1_idx) INNER JOIN recipe r ON (r.name = ehr.recipe_name AND r.cuisine_name = ehr.recipe_cuisine_name) INNER JOIN recipe_has_equipment rhe ON (rhe.recipe_name = r.name AND rhe.recipe_cuisine_name = r.cuisine_name) GROUP BY ehr.episode_id, ehr.episode_year ORDER BY amount DESC limit 1;
+----+-------------+-------+------------+--------+----------------------------------------------------------------------------+------------------------------------+---------+---------------------------------------------------+------+----------+----------------------------------------------+
| id | select_type | table | partitions | type   | possible_keys                                                              | key                                | key_len | ref                                               | rows | filtered | Extra                                        |
+----+-------------+-------+------------+--------+----------------------------------------------------------------------------+------------------------------------+---------+---------------------------------------------------+------+----------+----------------------------------------------+
|  1 | SIMPLE      | ehr   | NULL       | index  | PRIMARY,fk_episode_has_recipe_episode1_idx,fk_episode_has_recipe_chef1_idx | fk_episode_has_recipe_episode1_idx | 8       | NULL                                              |  500 |   100.00 | Using index; Using temporary; Using filesort |
|  1 | SIMPLE      | r     | NULL       | eq_ref | PRIMARY,fk_recipe_cuisine_idx                                              | PRIMARY                            | 772     | mydb.ehr.recipe_name,mydb.ehr.recipe_cuisine_name |    1 |   100.00 | Using index                                  |
|  1 | SIMPLE      | rhe   | NULL       | ref    | PRIMARY,fk_recipe_has_equipment_recipe1_idx                                | PRIMARY                            | 772     | mydb.ehr.recipe_name,mydb.ehr.recipe_cuisine_name |    3 |   100.00 | Using index                                  |
+----+-------------+-------+------------+--------+----------------------------------------------------------------------------+------------------------------------+---------+---------------------------------------------------+------+----------+----------------------------------------------+
3 rows in set, 1 warning (0.01 sec)
```

Trace:


```json
{
  "steps": [
    {
      "join_preparation": {
        "select#": 1,
        "steps": [
          {
            "expanded_query": "/* select#1 */ select `ehr`.`episode_id` AS `episode_id`,`ehr`.`episode_year` AS `episode_year`,count(0) AS `amount` from ((`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`) join `recipe` `r` on(((`r`.`name` = `ehr`.`recipe_name`) and (`r`.`cuisine_name` = `ehr`.`recipe_cuisine_name`)))) join `recipe_has_equipment` `rhe` on(((`rhe`.`recipe_name` = `r`.`name`) and (`rhe`.`recipe_cuisine_name` = `r`.`cuisine_name`)))) group by `ehr`.`episode_id`,`ehr`.`episode_year` order by `amount` desc limit 1"
          },
          {
            "transformations_to_nested_joins": {
              "transformations": [
                "JOIN_condition_to_WHERE",
                "parenthesis_removal"
              ],
              "expanded_query": "/* select#1 */ select `ehr`.`episode_id` AS `episode_id`,`ehr`.`episode_year` AS `episode_year`,count(0) AS `amount` from `episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`) join `recipe` `r` join `recipe_has_equipment` `rhe` where ((`rhe`.`recipe_name` = `r`.`name`) and (`rhe`.`recipe_cuisine_name` = `r`.`cuisine_name`) and (`r`.`name` = `ehr`.`recipe_name`) and (`r`.`cuisine_name` = `ehr`.`recipe_cuisine_name`)) group by `ehr`.`episode_id`,`ehr`.`episode_year` order by `amount` desc limit 1"
            }
          }
        ]
      }
    },
    {
      "join_optimization": {
        "select#": 1,
        "steps": [
          {
            "condition_processing": {
              "condition": "WHERE",
              "original_condition": "((`rhe`.`recipe_name` = `r`.`name`) and (`rhe`.`recipe_cuisine_name` = `r`.`cuisine_name`) and (`r`.`name` = `ehr`.`recipe_name`) and (`r`.`cuisine_name` = `ehr`.`recipe_cuisine_name`))",
              "steps": [
                {
                  "transformation": "equality_propagation",
                  "resulting_condition": "(multiple equal(`rhe`.`recipe_name`, `r`.`name`, `ehr`.`recipe_name`) and multiple equal(`rhe`.`recipe_cuisine_name`, `r`.`cuisine_name`, `ehr`.`recipe_cuisine_name`))"
                },
                {
                  "transformation": "constant_propagation",
                  "resulting_condition": "(multiple equal(`rhe`.`recipe_name`, `r`.`name`, `ehr`.`recipe_name`) and multiple equal(`rhe`.`recipe_cuisine_name`, `r`.`cuisine_name`, `ehr`.`recipe_cuisine_name`))"
                },
                {
                  "transformation": "trivial_condition_removal",
                  "resulting_condition": "(multiple equal(`rhe`.`recipe_name`, `r`.`name`, `ehr`.`recipe_name`) and multiple equal(`rhe`.`recipe_cuisine_name`, `r`.`cuisine_name`, `ehr`.`recipe_cuisine_name`))"
                }
              ]
            }
          },
          {
            "substitute_generated_columns": {
            }
          },
          {
            "table_dependencies": [
              {
                "table": "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)",
                "row_may_be_null": false,
                "map_bit": 0,
                "depends_on_map_bits": [
                ]
              },
              {
                "table": "`recipe` `r`",
                "row_may_be_null": false,
                "map_bit": 1,
                "depends_on_map_bits": [
                ]
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "row_may_be_null": false,
                "map_bit": 2,
                "depends_on_map_bits": [
                ]
              }
            ]
          },
          {
            "ref_optimizer_key_uses": [
              {
                "table": "`recipe` `r`",
                "field": "name",
                "equals": "`rhe`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "name",
                "equals": "`ehr`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "cuisine_name",
                "equals": "`rhe`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "cuisine_name",
                "equals": "`ehr`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "cuisine_name",
                "equals": "`rhe`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "cuisine_name",
                "equals": "`ehr`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "name",
                "equals": "`rhe`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe` `r`",
                "field": "name",
                "equals": "`ehr`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_name",
                "equals": "`r`.`name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_name",
                "equals": "`ehr`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_cuisine_name",
                "equals": "`r`.`cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_cuisine_name",
                "equals": "`ehr`.`recipe_cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_name",
                "equals": "`r`.`name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_name",
                "equals": "`ehr`.`recipe_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_cuisine_name",
                "equals": "`r`.`cuisine_name`",
                "null_rejecting": true
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "field": "recipe_cuisine_name",
                "equals": "`ehr`.`recipe_cuisine_name`",
                "null_rejecting": true
              }
            ]
          },
          {
            "rows_estimation": [
              {
                "table": "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)",
                "const_keys_added": {
                  "keys": [
                    "PRIMARY",
                    "fk_episode_has_recipe_episode1_idx",
                    "fk_episode_has_recipe_chef1_idx"
                  ],
                  "cause": "group_by"
                },
                "range_analysis": {
                  "table_scan": {
                    "rows": 500,
                    "cost": 55.1
                  },
                  "potential_range_indexes": [
                    {
                      "index": "PRIMARY",
                      "usable": true,
                      "key_parts": [
                        "episode_id",
                        "episode_year",
                        "recipe_name",
                        "recipe_cuisine_name",
                        "chef_id"
                      ]
                    },
                    {
                      "index": "fk_episode_has_recipe_recipe1_idx",
                      "usable": false,
                      "cause": "not_applicable"
                    },
                    {
                      "index": "fk_episode_has_recipe_episode1_idx",
                      "usable": true,
                      "key_parts": [
                        "episode_id",
                        "episode_year",
                        "recipe_name",
                        "recipe_cuisine_name",
                        "chef_id"
                      ]
                    },
                    {
                      "index": "fk_episode_has_recipe_chef1_idx",
                      "usable": true,
                      "key_parts": [
                        "chef_id",
                        "episode_id",
                        "episode_year",
                        "recipe_name",
                        "recipe_cuisine_name"
                      ]
                    }
                  ],
                  "best_covering_index_scan": {
                    "index": "fk_episode_has_recipe_chef1_idx",
                    "cost": 96.3636,
                    "chosen": false,
                    "cause": "cost"
                  },
                  "setup_range_conditions": [
                  ],
                  "group_index_skip_scan": {
                    "chosen": false,
                    "cause": "not_single_table"
                  },
                  "skip_scan_range": {
                    "chosen": false,
                    "cause": "not_single_table"
                  }
                }
              },
              {
                "table": "`recipe` `r`",
                "table_scan": {
                  "rows": 88,
                  "cost": 3
                }
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "table_scan": {
                  "rows": 306,
                  "cost": 0.25
                }
              }
            ]
          },
          {
            "considered_execution_plans": [
              {
                "plan_prefix": [
                ],
                "table": "`recipe` `r`",
                "best_access_path": {
                  "considered_access_paths": [
                    {
                      "access_type": "ref",
                      "index": "PRIMARY",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "access_type": "ref",
                      "index": "fk_recipe_cuisine_idx",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "rows_to_scan": 88,
                      "filtering_effect": [
                      ],
                      "final_filtering_effect": 1,
                      "access_type": "scan",
                      "resulting_rows": 88,
                      "cost": 11.8,
                      "chosen": true
                    }
                  ]
                },
                "condition_filtering_pct": 100,
                "rows_for_plan": 88,
                "cost_for_plan": 11.8,
                "rest_of_plan": [
                  {
                    "plan_prefix": [
                      "`recipe` `r`"
                    ],
                    "table": "`recipe_has_equipment` `rhe`",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "access_type": "ref",
                          "index": "PRIMARY",
                          "rows": 3.47727,
                          "cost": 63.5,
                          "chosen": true
                        },
                        {
                          "access_type": "ref",
                          "index": "fk_recipe_has_equipment_recipe1_idx",
                          "rows": 3.47727,
                          "cost": 162.2,
                          "chosen": false
                        },
                        {
                          "access_type": "scan",
                          "chosen": false,
                          "cause": "covering_index_better_than_full_scan"
                        }
                      ]
                    },
                    "condition_filtering_pct": 100,
                    "rows_for_plan": 306,
                    "cost_for_plan": 75.3,
                    "rest_of_plan": [
                      {
                        "plan_prefix": [
                          "`recipe` `r`",
                          "`recipe_has_equipment` `rhe`"
                        ],
                        "table": "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)",
                        "best_access_path": {
                          "considered_access_paths": [
                            {
                              "rows_to_scan": 500,
                              "filtering_effect": [
                              ],
                              "final_filtering_effect": 1,
                              "access_type": "scan",
                              "using_join_cache": true,
                              "buffers_needed": 2,
                              "resulting_rows": 500,
                              "cost": 15308.4,
                              "chosen": true
                            }
                          ]
                        },
                        "condition_filtering_pct": 0.2,
                        "rows_for_plan": 306,
                        "cost_for_plan": 15383.7,
                        "chosen": true
                      }
                    ]
                  },
                  {
                    "plan_prefix": [
                      "`recipe` `r`"
                    ],
                    "table": "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "rows_to_scan": 500,
                          "filtering_effect": [
                          ],
                          "final_filtering_effect": 1,
                          "access_type": "scan",
                          "using_join_cache": true,
                          "buffers_needed": 1,
                          "resulting_rows": 500,
                          "cost": 4403.78,
                          "chosen": true
                        }
                      ]
                    },
                    "condition_filtering_pct": 0.2,
                    "rows_for_plan": 88,
                    "cost_for_plan": 4415.58,
                    "rest_of_plan": [
                      {
                        "plan_prefix": [
                          "`recipe` `r`",
                          "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)"
                        ],
                        "table": "`recipe_has_equipment` `rhe`",
                        "best_access_path": {
                          "considered_access_paths": [
                            {
                              "access_type": "ref",
                              "index": "PRIMARY",
                              "rows": 3.47727,
                              "cost": 63.5,
                              "chosen": true
                            },
                            {
                              "access_type": "ref",
                              "index": "fk_recipe_has_equipment_recipe1_idx",
                              "rows": 3.47727,
                              "cost": 162.2,
                              "chosen": false
                            },
                            {
                              "access_type": "scan",
                              "chosen": false,
                              "cause": "covering_index_better_than_full_scan"
                            }
                          ]
                        },
                        "condition_filtering_pct": 100,
                        "rows_for_plan": 306,
                        "cost_for_plan": 4479.08,
                        "chosen": true
                      }
                    ]
                  }
                ]
              },
              {
                "plan_prefix": [
                ],
                "table": "`recipe_has_equipment` `rhe`",
                "best_access_path": {
                  "considered_access_paths": [
                    {
                      "access_type": "ref",
                      "index": "PRIMARY",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "access_type": "ref",
                      "index": "fk_recipe_has_equipment_recipe1_idx",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "rows_to_scan": 306,
                      "filtering_effect": [
                      ],
                      "final_filtering_effect": 1,
                      "access_type": "scan",
                      "resulting_rows": 306,
                      "cost": 30.85,
                      "chosen": true
                    }
                  ]
                },
                "condition_filtering_pct": 100,
                "rows_for_plan": 306,
                "cost_for_plan": 30.85,
                "rest_of_plan": [
                  {
                    "plan_prefix": [
                      "`recipe_has_equipment` `rhe`"
                    ],
                    "table": "`recipe` `r`",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "access_type": "eq_ref",
                          "index": "PRIMARY",
                          "rows": 1,
                          "cost": 336.6,
                          "chosen": true,
                          "cause": "clustered_pk_chosen_by_heuristics"
                        },
                        {
                          "access_type": "scan",
                          "chosen": false,
                          "cause": "covering_index_better_than_full_scan"
                        }
                      ]
                    },
                    "condition_filtering_pct": 100,
                    "rows_for_plan": 306,
                    "cost_for_plan": 367.45,
                    "rest_of_plan": [
                      {
                        "plan_prefix": [
                          "`recipe_has_equipment` `rhe`",
                          "`recipe` `r`"
                        ],
                        "table": "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)",
                        "best_access_path": {
                          "considered_access_paths": [
                            {
                              "rows_to_scan": 500,
                              "filtering_effect": [
                              ],
                              "final_filtering_effect": 1,
                              "access_type": "scan",
                              "using_join_cache": true,
                              "buffers_needed": 2,
                              "resulting_rows": 500,
                              "cost": 15308.4,
                              "chosen": true
                            }
                          ]
                        },
                        "condition_filtering_pct": 0.2,
                        "rows_for_plan": 306,
                        "cost_for_plan": 15675.9,
                        "pruned_by_cost": true
                      }
                    ]
                  },
                  {
                    "plan_prefix": [
                      "`recipe_has_equipment` `rhe`"
                    ],
                    "table": "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "rows_to_scan": 500,
                          "filtering_effect": [
                          ],
                          "final_filtering_effect": 1,
                          "access_type": "scan",
                          "using_join_cache": true,
                          "buffers_needed": 1,
                          "resulting_rows": 500,
                          "cost": 15305.7,
                          "chosen": true
                        }
                      ]
                    },
                    "condition_filtering_pct": 0.2,
                    "rows_for_plan": 306,
                    "cost_for_plan": 15336.6,
                    "pruned_by_cost": true
                  }
                ]
              },
              {
                "plan_prefix": [
                ],
                "table": "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)",
                "best_access_path": {
                  "considered_access_paths": [
                    {
                      "rows_to_scan": 500,
                      "filtering_effect": [
                      ],
                      "final_filtering_effect": 1,
                      "access_type": "scan",
                      "resulting_rows": 500,
                      "cost": 53,
                      "chosen": true
                    }
                  ]
                },
                "condition_filtering_pct": 100,
                "rows_for_plan": 500,
                "cost_for_plan": 53,
                "rest_of_plan": [
                  {
                    "plan_prefix": [
                      "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)"
                    ],
                    "table": "`recipe` `r`",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "access_type": "eq_ref",
                          "index": "PRIMARY",
                          "rows": 1,
                          "cost": 550,
                          "chosen": true,
                          "cause": "clustered_pk_chosen_by_heuristics"
                        },
                        {
                          "access_type": "scan",
                          "chosen": false,
                          "cause": "covering_index_better_than_full_scan"
                        }
                      ]
                    },
                    "condition_filtering_pct": 100,
                    "rows_for_plan": 500,
                    "cost_for_plan": 603,
                    "rest_of_plan": [
                      {
                        "plan_prefix": [
                          "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)",
                          "`recipe` `r`"
                        ],
                        "table": "`recipe_has_equipment` `rhe`",
                        "best_access_path": {
                          "considered_access_paths": [
                            {
                              "access_type": "ref",
                              "index": "PRIMARY",
                              "rows": 3.47727,
                              "cost": 360.795,
                              "chosen": true
                            },
                            {
                              "access_type": "ref",
                              "index": "fk_recipe_has_equipment_recipe1_idx",
                              "rows": 3.47727,
                              "cost": 921.591,
                              "chosen": false
                            },
                            {
                              "access_type": "scan",
                              "chosen": false,
                              "cause": "covering_index_better_than_full_scan"
                            }
                          ]
                        },
                        "added_to_eq_ref_extension": false
                      },
                      {
                        "plan_prefix": [
                          "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)",
                          "`recipe` `r`"
                        ],
                        "table": "`recipe_has_equipment` `rhe`",
                        "best_access_path": {
                          "considered_access_paths": [
                            {
                              "access_type": "ref",
                              "index": "PRIMARY",
                              "rows": 3.47727,
                              "cost": 360.795,
                              "chosen": true
                            },
                            {
                              "access_type": "ref",
                              "index": "fk_recipe_has_equipment_recipe1_idx",
                              "rows": 3.47727,
                              "cost": 921.591,
                              "chosen": false
                            },
                            {
                              "access_type": "scan",
                              "chosen": false,
                              "cause": "covering_index_better_than_full_scan"
                            }
                          ]
                        },
                        "condition_filtering_pct": 100,
                        "rows_for_plan": 1738.64,
                        "cost_for_plan": 963.795,
                        "chosen": true
                      }
                    ]
                  },
                  {
                    "plan_prefix": [
                      "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)"
                    ],
                    "table": "`recipe_has_equipment` `rhe`",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "access_type": "ref",
                          "index": "PRIMARY",
                          "rows": 3.47727,
                          "cost": 360.795,
                          "chosen": true
                        },
                        {
                          "access_type": "ref",
                          "index": "fk_recipe_has_equipment_recipe1_idx",
                          "rows": 3.47727,
                          "cost": 921.591,
                          "chosen": false
                        },
                        {
                          "access_type": "scan",
                          "chosen": false,
                          "cause": "covering_index_better_than_full_scan"
                        }
                      ]
                    },
                    "condition_filtering_pct": 100,
                    "rows_for_plan": 1738.64,
                    "cost_for_plan": 413.795,
                    "rest_of_plan": [
                      {
                        "plan_prefix": [
                          "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)",
                          "`recipe_has_equipment` `rhe`"
                        ],
                        "table": "`recipe` `r`",
                        "best_access_path": {
                          "considered_access_paths": [
                            {
                              "access_type": "eq_ref",
                              "index": "PRIMARY",
                              "rows": 1,
                              "cost": 673.864,
                              "chosen": true,
                              "cause": "clustered_pk_chosen_by_heuristics"
                            },
                            {
                              "access_type": "scan",
                              "chosen": false,
                              "cause": "covering_index_better_than_full_scan"
                            }
                          ]
                        },
                        "condition_filtering_pct": 100,
                        "rows_for_plan": 1738.64,
                        "cost_for_plan": 1087.66,
                        "pruned_by_cost": true
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "attaching_conditions_to_tables": {
              "original_condition": "((`r`.`cuisine_name` = `ehr`.`recipe_cuisine_name`) and (`rhe`.`recipe_cuisine_name` = `ehr`.`recipe_cuisine_name`) and (`r`.`name` = `ehr`.`recipe_name`) and (`rhe`.`recipe_name` = `ehr`.`recipe_name`))",
              "attached_conditions_computation": [
              ],
              "attached_conditions_summary": [
                {
                  "table": "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)",
                  "attached": null
                },
                {
                  "table": "`recipe` `r`",
                  "attached": "((`r`.`cuisine_name` = `ehr`.`recipe_cuisine_name`) and (`r`.`name` = `ehr`.`recipe_name`))"
                },
                {
                  "table": "`recipe_has_equipment` `rhe`",
                  "attached": "((`rhe`.`recipe_cuisine_name` = `ehr`.`recipe_cuisine_name`) and (`rhe`.`recipe_name` = `ehr`.`recipe_name`))"
                }
              ]
            }
          },
          {
            "optimizing_distinct_group_by_order_by": {
              "simplifying_order_by": {
                "original_clause": "`amount` desc",
                "items": [
                  {
                    "item": "count(0)"
                  }
                ],
                "resulting_clause_is_simple": false,
                "resulting_clause": "`amount` desc"
              },
              "simplifying_group_by": {
                "original_clause": "`ehr`.`episode_id`,`ehr`.`episode_year`",
                "items": [
                  {
                    "item": "`ehr`.`episode_id`"
                  },
                  {
                    "item": "`ehr`.`episode_year`"
                  }
                ],
                "resulting_clause_is_simple": true,
                "resulting_clause": "`ehr`.`episode_id`,`ehr`.`episode_year`"
              }
            }
          },
          {
            "reconsidering_access_paths_for_index_ordering": {
              "clause": "GROUP BY",
              "steps": [
              ],
              "index_order_summary": {
                "table": "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)",
                "index_provides_order": true,
                "order_direction": "asc",
                "index": "fk_episode_has_recipe_episode1_idx",
                "plan_changed": true,
                "access_type": "index"
              }
            }
          },
          {
            "finalizing_table_conditions": [
              {
                "table": "`recipe` `r`",
                "original_table_condition": "((`r`.`cuisine_name` = `ehr`.`recipe_cuisine_name`) and (`r`.`name` = `ehr`.`recipe_name`))",
                "final_table_condition   ": null
              },
              {
                "table": "`recipe_has_equipment` `rhe`",
                "original_table_condition": "((`rhe`.`recipe_cuisine_name` = `ehr`.`recipe_cuisine_name`) and (`rhe`.`recipe_name` = `ehr`.`recipe_name`))",
                "final_table_condition   ": null
              }
            ]
          },
          {
            "refine_plan": [
              {
                "table": "`episode_has_recipe` `ehr` IGNORE INDEX (`fk_episode_has_recipe_recipe1_idx`)"
              },
              {
                "table": "`recipe` `r`"
              },
              {
                "table": "`recipe_has_equipment` `rhe`"
              }
            ]
          },
          {
            "considering_tmp_tables": [
              {
                "adding_tmp_table_in_plan_at_position": 3,
                "write_method": "write_group_row_when_complete"
              },
              {
                "adding_sort_to_table": ""
              }
            ]
          }
        ]
      }
    },
    {
      "join_explain": {
        "select#": 1,
        "steps": [
        ]
      }
    }
  ]
}
```

Παρατηρούμε παρόμοιες αλλαγές με την 3.6, και την προσθήκη του πεδίου reconsidering_access_paths_for_index_ordering στα optimizations.