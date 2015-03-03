def create_proprietor_title_in_db(title_data)

  title_number = title_data[:title_number]
  postcode = title_data[:postcode]
  street_name = title_data[:street_name]
  house_no = title_data[:house_no]
  town = title_data[:town]
  surname = title_data[:surname]
  forename = title_data[:forename]
  name_category = title_data[:name_category]
  full_text = title_data[:full_text]
  multi_proprietors = title_data[:multi_proprietors]
  last_app_timestamp = title_data[:last_app_timestamp]
  if multi_proprietors == 'TwoPI'
    multiple_proprietors_json = ",{
    \"addresses\": [
      {
        \"postal_county\": \"London\",
        \"address_string\":  \"#{house_no}, #{street_name}, #{town} #{postcode}\",
        \"address_type\": \"UK\",
        \"auto_uppercase_override\": true
      }
    ],
    \"name\": {
      \"surname\": \"#{surname}\",
      \"forename\": \"#{forename}\",
      \"name_category\": \"#{name_category}\",
      \"auto_uppercase_override\": true
    }
  }"
  elsif multi_proprietors == 'OnePIOneCharity'
    multiple_proprietors_json = "PlaceHolder"
  else
    multiple_proprietors_json = ""
  end

  create_title_sql = <<-eos
INSERT INTO "title_register_data" ("title_number", "register_data", "geometry_data") VALUES (
  '#{title_number}',
  '{
      "address": {
          "address_string": "#{house_no} #{street_name}, #{town} (#{postcode})",
          "postcode": "#{postcode}",
          "town": "#{town}",
          "house_no": "#{house_no}",
          "street_name": "#{street_name}"
      },
      "proprietors": [
          {
              "addresses": [
                  {
                      "address_string":  "#{house_no}, #{street_name}, #{town} #{postcode}",
                      "address_type": "UK",
                      "house_no": "#{house_no}",
                      "postcode": "#{postcode}",
                      "street_name": "#{street_name}",
                      "town": "#{town}"
                  }
              ],
              "name": {
                "surname": "#{surname}",
                "forename": "#{forename}",
                "name_category": "#{name_category}"
              }
          }
          #{multiple_proprietors_json}
      ],
      "last_application_timestamp": "#{last_app_timestamp}",
      "tenure": "Freehold"
   }',
  '{
      "extent": {
          "crs": {
              "properties": {
                  "name": "urn:ogc:def:crs:EPSG::27700"
              },
              "type": "name"
          },
          "geometry": {
              "coordinates": [
                  [
                      [
                          508263.97,
                          221692.13
                      ],
                      [
                          508266.4,
                          221698.84
                      ],
                      [
                          508266.35,
                          221700.25
                      ],
                      [
                          508270.3,
                          221711.15
                      ],
                      [
                          508273.29,
                          221719.53
                      ],
                      [
                          508271.4,
                          221721.65
                      ],
                      [
                          508270.68,
                          221722.44
                      ],
                      [
                          508269.69,
                          221723.53
                      ],
                      [
                          508263.58,
                          221706.87
                      ],
                      [
                          508261.346,
                          221700.587
                      ],
                      [
                          508258.98,
                          221693.93
                      ],
                      [
                          508258.01,
                          221691.18
                      ],
                      [
                          508262,
                          221689.66
                      ],
                      [
                          508262.95,
                          221689.3
                      ],
                      [
                          508263.97,
                          221692.13
                      ]
                  ]
              ],
              "type": "Polygon"
          },
          "properties": {
              "colour": 17,
              "feature_id": 4013,
              "graphic_type": "Bordered Polygon",
              "render_attributes": {
                  "border_colour": 17,
                  "border_width": 1000,
                  "exterior_edge_colour": 17,
                  "exterior_edge_thickness": 1,
                  "exterior_edge_thickness_units": "Pixels",
                  "fill_colour": 28,
                  "fill_style": 0,
                  "render_level": "0"
              },
              "width": 1000
          },
          "type": "Feature"
      },
      "index": {
          "crs": {
              "properties": {
                  "name": "urn:ogc:def:crs:EPSG::27700"
              },
              "type": "name"
          },
          "geometry": {
              "coordinates": [
                  [
                      [
                          508263.97,
                          221692.13
                      ],
                      [
                          508266.4,
                          221698.84
                      ],
                      [
                          508266.35,
                          221700.25
                      ],
                      [
                          508270.3,
                          221711.15
                      ],
                      [
                          508273.29,
                          221719.53
                      ],
                      [
                          508271.4,
                          221721.65
                      ],
                      [
                          508270.68,
                          221722.44
                      ],
                      [
                          508269.69,
                          221723.53
                      ],
                      [
                          508263.58,
                          221706.87
                      ],
                      [
                          508258.98,
                          221693.93
                      ],
                      [
                          508258.01,
                          221691.18
                      ],
                      [
                          508262,
                          221689.66
                      ],
                      [
                          508262.95,
                          221689.3
                      ],
                      [
                          508263.97,
                          221692.13
                      ]
                  ]
              ],
              "type": "Polygon"
          },
          "properties": {
              "colour": 25,
              "feature_id": 4019,
              "graphic_type": "Bordered Polygon",
              "render_attributes": {
                  "border_colour": 25,
                  "border_width": 0,
                  "exterior_edge_colour": 1,
                  "exterior_edge_thickness": 2,
                  "exterior_edge_thickness_units": "Pixels",
                  "fill_colour": 25,
                  "fill_style": 9,
                  "render_level": "0"
              },
              "width": 0
          },
          "type": "Feature"
      },
      "map": {
          "crs": {
              "properties": {
                  "name": "urn:ogc:def:crs:EPSG::27700"
              },
              "type": "name"
          },
          "features": [
              {
                  "geometry": {
                      "coordinates": [
                          [
                              508235.35,
                              221720.2
                          ],
                          [
                              508230.9,
                              221712.5
                          ]
                      ],
                      "type": "LineString"
                  },
                  "properties": {
                      "feature_id": 10018,
                      "graphic_type": "Poly Line",
                      "render_attributes": {
                          "render_level": "0"
                      }
                  },
                  "type": "Feature"
              },
              {
                  "geometry": {
                      "coordinates": [
                          508296.75,
                          221743.4
                      ],
                      "type": "Point"
                  },
                  "properties": {
                      "feature_id": 10169,
                      "graphic_type": "Text",
                      "height": 1000,
                      "horizontal_alignment": null,
                      "render_attributes": {
                          "render_level": "0",
                          "text_horizontal_alignment": null,
                          "text_vertical_alignment": "Middle"
                      },
                      "rotation": -0.9705304697353966,
                      "value": "AVONDALE ROAD",
                      "vertical_alignment": "Middle"
                  },
                  "type": "Feature"
              },
              {
                  "geometry": {
                      "coordinates": [
                          508298.7,
                          221672.85
                      ],
                      "type": "Point"
                  },
                  "properties": {
                      "feature_id": 10169,
                      "graphic_type": "Text",
                      "height": 1000,
                      "horizontal_alignment": null,
                      "render_attributes": {
                          "render_level": "0",
                          "text_horizontal_alignment": null,
                          "text_vertical_alignment": "Middle"
                      },
                      "rotation": -0.2810061055808009,
                      "value": "HAZELBURY CRESCENT",
                      "vertical_alignment": "Middle"
                  },
                  "type": "Feature"
              },
              {
                  "geometry": {
                      "coordinates": [
                          508261.71,
                          221765.2
                      ],
                      "type": "Point"
                  },
                  "properties": {
                      "feature_id": 10026,
                      "graphic_type": "Text",
                      "height": 1000,
                      "horizontal_alignment": "Left",
                      "render_attributes": {
                          "render_level": "0",
                          "text_horizontal_alignment": "Left",
                          "text_vertical_alignment": "Baseline"
                      },
                      "rotation": 2.1307951881723985,
                      "value": "35",
                      "vertical_alignment": "Baseline"
                  },
                  "type": "Feature"
              },
              {
                  "geometry": {
                      "coordinates": [
                          508259.63,
                          221763.9
                      ],
                      "type": "Point"
                  },
                  "properties": {
                      "feature_id": 10026,
                      "graphic_type": "Text",
                      "height": 1000,
                      "horizontal_alignment": "Left",
                      "render_attributes": {
                          "render_level": "0",
                          "text_horizontal_alignment": "Left",
                          "text_vertical_alignment": "Baseline"
                      },
                      "rotation": 2.1307951881723985,
                      "value": "33",
                      "vertical_alignment": "Baseline"
                  },
                  "type": "Feature"
              },
              {
                  "geometry": {
                      "coordinates": [
                          508257.48,
                          221762.54
                      ],
                      "type": "Point"
                  },
                  "properties": {
                      "feature_id": 10026,
                      "graphic_type": "Text",
                      "height": 1000,
                      "horizontal_alignment": "Left",
                      "render_attributes": {
                          "render_level": "0",
                          "text_horizontal_alignment": "Left",
                          "text_vertical_alignment": "Baseline"
                      },
                      "rotation": 2.1307951881723985,
                      "value": "31",
                      "vertical_alignment": "Baseline"
                  },
                  "type": "Feature"
              },
              {
                  "geometry": {
                      "coordinates": [
                          508302.6,
                          221662.6
                      ],
                      "type": "Point"
                  },
                  "properties": {
                      "feature_id": 10026,
                      "graphic_type": "Text",
                      "height": 1000,
                      "horizontal_alignment": "Centre",
                      "render_attributes": {
                          "render_level": "0",
                          "text_horizontal_alignment": "Centre",
                          "text_vertical_alignment": "Baseline"
                      },
                      "rotation": 2.9999870521081,
                      "value": "21",
                      "vertical_alignment": "Baseline"
                  },
                  "type": "Feature"
              },
              {
                  "geometry": {
                      "coordinates": [
                          508282.3,
                          221747.9
                      ],
                      "type": "Point"
                  },
                  "properties": {
                      "feature_id": 10026,
                      "graphic_type": "Text",
                      "height": 1000,
                      "horizontal_alignment": "Centre",
                      "render_attributes": {
                          "render_level": "0",
                          "text_horizontal_alignment": "Centre",
                          "text_vertical_alignment": "Baseline"
                      },
                      "rotation": 2.205960246778795,
                      "value": "27",
                      "vertical_alignment": "Baseline"
                  },
                  "type": "Feature"
              },
              {
                  "geometry": {
                      "coordinates": [
                          508223.04,
                          221718.34
                      ],
                      "type": "Point"
                  },
                  "properties": {
                      "feature_id": 10026,
                      "graphic_type": "Text",
                      "height": 1000,
                      "horizontal_alignment": "Left",
                      "render_attributes": {
                          "render_level": "0",
                          "text_horizontal_alignment": "Left",
                          "text_vertical_alignment": "Baseline"
                      },
                      "rotation": 2.6231071472844465,
                      "value": "1 to 8",
                      "vertical_alignment": "Baseline"
                  },
                  "type": "Feature"
              },
              {
                  "geometry": {
                      "coordinates": [
                          508222.34,
                          221738.99
                      ],
                      "type": "Point"
                  },
                  "properties": {
                      "feature_id": 10026,
                      "graphic_type": "Text",
                      "height": 1000,
                      "horizontal_alignment": "Left",
                      "render_attributes": {
                          "render_level": "0",
                          "text_horizontal_alignment": "Left",
                          "text_vertical_alignment": "Baseline"
                      },
                      "rotation": 0,
                      "value": "Hazelbury",
                      "vertical_alignment": "Baseline"
                  },
                  "type": "Feature"
              },
              {
                  "geometry": {
                      "coordinates": [
                          508287.9,
                          221685.45
                      ],
                      "type": "Point"
                  },
                  "properties": {
                      "feature_id": 10026,
                      "graphic_type": "Text",
                      "height": 1000,
                      "horizontal_alignment": "Centre",
                      "render_attributes": {
                          "render_level": "0",
                          "text_horizontal_alignment": "Centre",
                          "text_vertical_alignment": "Baseline"
                      },
                      "rotation": -0.26892600687620144,
                      "value": "6",
                      "vertical_alignment": "Baseline"
                  },
                  "type": "Feature"
              },
              {
                  "geometry": {
                      "coordinates": [
                          508266.35,
                          221750.95
                      ],
                      "type": "Point"
                  },
                  "properties": {
                      "feature_id": 10026,
                      "graphic_type": "Text",
                      "height": 1000,
                      "horizontal_alignment": "Centre",
                      "render_attributes": {
                          "render_level": "0",
                          "text_horizontal_alignment": "Centre",
                          "text_vertical_alignment": "Baseline"
                      },
                      "rotation": -0.9478083793148405,
                      "value": "1 to 6",
                      "vertical_alignment": "Baseline"
                  },
                  "type": "Feature"
              },
              {
                  "geometry": {
                      "coordinates": [
                          508311.3,
                          221738.9
                      ],
                      "type": "Point"
                  },
                  "properties": {
                      "feature_id": 10026,
                      "graphic_type": "Text",
                      "height": 1000,
                      "horizontal_alignment": "Centre",
                      "render_attributes": {
                          "render_level": "0",
                          "text_horizontal_alignment": "Centre",
                          "text_vertical_alignment": "Baseline"
                      },
                      "rotation": -0.9829940636369674,
                      "value": "30",
                      "vertical_alignment": "Baseline"
                  },
                  "type": "Feature"
              },
              {
                  "geometry": {
                      "coordinates": [
                          508238.3,
                          221682.4
                      ],
                      "type": "Point"
                  },
                  "properties": {
                      "feature_id": 10026,
                      "graphic_type": "Text",
                      "height": 1000,
                      "horizontal_alignment": "Centre",
                      "render_attributes": {
                          "render_level": "0",
                          "text_horizontal_alignment": "Centre",
                          "text_vertical_alignment": "Baseline"
                      },
                      "rotation": 2.773053769300268,
                      "value": "47",
                      "vertical_alignment": "Baseline"
                  },
                  "type": "Feature"
              }
          ],
          "properties": {
              "map_reference": "TL0821NW",
              "orientation_code": "P",
              "print_size": "A4",
              "scale": "500  ",
              "stamp_code_1": " ",
              "stamp_code_2": " ",
              "stamp_code_3": " ",
              "stamp_code_4": " ",
              "stamp_code_5": " ",
              "stamp_text_1": " ",
              "stamp_text_2": " ",
              "stamp_text_3": " ",
              "stamp_text_4": " ",
              "stamp_text_5": " "
          },
          "type": "FeatureCollection"
      },
      "references": [
          {
              "crs": {
                  "properties": {
                      "name": "urn:ogc:def:crs:EPSG::27700"
                  },
                  "type": "name"
              },
              "features": [
                  {
                      "geometry": {
                          "coordinates": [
                              [
                                  508264.15,
                                  221699.65
                              ],
                              [
                                  508261.346,
                                  221700.587
                              ]
                          ],
                          "type": "LineString"
                      },
                      "properties": {
                          "feature_id": 4002,
                          "graphic_type": "Poly Line",
                          "render_attributes": {
                              "edge_colour": 7,
                              "edge_style": 7,
                              "edge_thickness": 1,
                              "render_level": "0"
                          }
                      },
                      "type": "Feature"
                  }
              ],
              "properties": {
                  "colour_code": 2,
                  "description": "black pecked line",
                  "graphic_code": 2,
                  "text_code": 0
              },
              "type": "FeatureCollection"
          },
          {
              "crs": {
                  "properties": {
                      "name": "urn:ogc:def:crs:EPSG::27700"
                  },
                  "type": "name"
              },
              "features": [
                  {
                      "geometry": {
                          "coordinates": [
                              [
                                  [
                                      508264.15,
                                      221699.65
                                  ],
                                  [
                                      508266.35,
                                      221705.9
                                  ],
                                  [
                                      508263.58,
                                      221706.87
                                  ],
                                  [
                                      508261.346,
                                      221700.587
                                  ],
                                  [
                                      508264.15,
                                      221699.65
                                  ]
                              ]
                          ],
                          "type": "Polygon"
                      },
                      "properties": {
                          "colour": 0,
                          "feature_id": 4011,
                          "graphic_type": "Bordered Polygon",
                          "render_attributes": {
                              "border_colour": 0,
                              "border_width": 0,
                              "exterior_edge_colour": 9,
                              "exterior_edge_thickness": 1,
                              "exterior_edge_thickness_units": "Pixels",
                              "fill_colour": 28,
                              "fill_style": 9,
                              "render_level": "0"
                          },
                          "width": 0
                      },
                      "type": "Feature"
                  }
              ],
              "properties": {
                  "colour_code": 5,
                  "description": "tinted blue",
                  "graphic_code": 15,
                  "text_code": 0
              },
              "type": "FeatureCollection"
          }
      ]
   }'
);
eos

# calls the database conection - settings in the config.rb
# and executes the create property sql
$db_connection.exec(create_title_sql)

end


def update_title_geometry_with_multiple_index_polygons(title_number)
update_title_geometry_sql = <<-eos
UPDATE "title_register_data"
SET geometry_data = '{
    "extent": {
        "crs": {
            "properties": {
                "name": "urn:ogc:def:crs:EPSG::27700"
            },
            "type": "name"
        },
        "geometry": {
            "coordinates": [
                [
                    [
                        508263.97,
                        221692.13
                    ],
                    [
                        508266.4,
                        221698.84
                    ],
                    [
                        508266.35,
                        221700.25
                    ],
                    [
                        508270.3,
                        221711.15
                    ],
                    [
                        508273.29,
                        221719.53
                    ],
                    [
                        508271.4,
                        221721.65
                    ],
                    [
                        508270.68,
                        221722.44
                    ],
                    [
                        508269.69,
                        221723.53
                    ],
                    [
                        508263.58,
                        221706.87
                    ],
                    [
                        508261.346,
                        221700.587
                    ],
                    [
                        508258.98,
                        221693.93
                    ],
                    [
                        508258.01,
                        221691.18
                    ],
                    [
                        508262,
                        221689.66
                    ],
                    [
                        508262.95,
                        221689.3
                    ],
                    [
                        508263.97,
                        221692.13
                    ]
                ]
            ],
            "type": "Polygon"
        },
        "properties": {
            "colour": 17,
            "feature_id": 4013,
            "graphic_type": "Bordered Polygon",
            "render_attributes": {
                "border_colour": 17,
                "border_width": 1000,
                "exterior_edge_colour": 17,
                "exterior_edge_thickness": 1,
                "exterior_edge_thickness_units": "Pixels",
                "fill_colour": 28,
                "fill_style": 0,
                "render_level": "0"
            },
            "width": 1000
        },
        "type": "Feature"
    },
    "index": {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  266053.52,
                  192457.32
                ],
                [
                  266050.72,
                  192460.66
                ],
                [
                  266047.46,
                  192457.93
                ],
                [
                  266049.17,
                  192455.9
                ],
                [
                  266050.26,
                  192454.59
                ],
                [
                  266053.52,
                  192457.32
                ]
              ]
            ]
          },
          "properties": {
            "graphic_type": "Bordered Polygon",
            "feature_id": 4019,
            "colour": 27,
            "width": 0,
            "render_attributes": {
              "border_colour": 27,
              "border_width": 0,
              "exterior_edge_colour": 1,
              "exterior_edge_thickness": 2.0,
              "fill_colour": 27,
              "fill_style": 9,
              "render_level": "0"
            }
          }
        },
        {
          "type": "Feature",
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  266239.06,
                  192429.13
                ],
                [
                  266250.037,
                  192429.378
                ],
                [
                  266239.027,
                  192440.379
                ],
                [
                  266239.06,
                  192429.13
                ]
              ]
            ]
          },
          "properties": {
            "graphic_type": "Bordered Polygon",
            "feature_id": 4019,
            "colour": 25,
            "width": 0,
            "render_attributes": {
              "border_colour": 25,
              "border_width": 0,
              "exterior_edge_colour": 1,
              "exterior_edge_thickness": 2.0,
              "fill_colour": 25,
              "fill_style": 9,
              "render_level": "0"
            }
          }
        },
        {
          "type": "Feature",
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  266361.852,
                  192477.995
                ],
                [
                  266381.702,
                  192477.806
                ],
                [
                  266361.69,
                  192497.79
                ],
                [
                  266361.852,
                  192477.995
                ]
              ],
              [
                [
                  266366,
                  192482
                ],
                [
                  266372,
                  192482
                ],
                [
                  266366,
                  192488
                ],
                [
                  266366,
                  192482
                ]
              ]
            ]
          },
          "properties": {
            "graphic_type": "Bordered Polygon",
            "feature_id": 4019,
            "colour": 25,
            "width": 0,
            "render_attributes": {
              "border_colour": 25,
              "border_width": 0,
              "exterior_edge_colour": 1,
              "exterior_edge_thickness": 2.0,
              "fill_colour": 25,
              "fill_style": 9,
              "render_level": "0"
            }
          }
        }
      ],
      "crs": {
        "type": "name",
        "properties": {
          "name": "urn:ogc:def:crs:EPSG::27700"
        }
      }
    },
    "map": {
        "crs": {
            "properties": {
                "name": "urn:ogc:def:crs:EPSG::27700"
            },
            "type": "name"
        },
        "features": [
            {
                "geometry": {
                    "coordinates": [
                        [
                            508235.35,
                            221720.2
                        ],
                        [
                            508230.9,
                            221712.5
                        ]
                    ],
                    "type": "LineString"
                },
                "properties": {
                    "feature_id": 10018,
                    "graphic_type": "Poly Line",
                    "render_attributes": {
                        "render_level": "0"
                    }
                },
                "type": "Feature"
            },
            {
                "geometry": {
                    "coordinates": [
                        508296.75,
                        221743.4
                    ],
                    "type": "Point"
                },
                "properties": {
                    "feature_id": 10169,
                    "graphic_type": "Text",
                    "height": 1000,
                    "horizontal_alignment": null,
                    "render_attributes": {
                        "render_level": "0",
                        "text_horizontal_alignment": null,
                        "text_vertical_alignment": "Middle"
                    },
                    "rotation": -0.9705304697353966,
                    "value": "AVONDALE ROAD",
                    "vertical_alignment": "Middle"
                },
                "type": "Feature"
            },
            {
                "geometry": {
                    "coordinates": [
                        508298.7,
                        221672.85
                    ],
                    "type": "Point"
                },
                "properties": {
                    "feature_id": 10169,
                    "graphic_type": "Text",
                    "height": 1000,
                    "horizontal_alignment": null,
                    "render_attributes": {
                        "render_level": "0",
                        "text_horizontal_alignment": null,
                        "text_vertical_alignment": "Middle"
                    },
                    "rotation": -0.2810061055808009,
                    "value": "HAZELBURY CRESCENT",
                    "vertical_alignment": "Middle"
                },
                "type": "Feature"
            },
            {
                "geometry": {
                    "coordinates": [
                        508261.71,
                        221765.2
                    ],
                    "type": "Point"
                },
                "properties": {
                    "feature_id": 10026,
                    "graphic_type": "Text",
                    "height": 1000,
                    "horizontal_alignment": "Left",
                    "render_attributes": {
                        "render_level": "0",
                        "text_horizontal_alignment": "Left",
                        "text_vertical_alignment": "Baseline"
                    },
                    "rotation": 2.1307951881723985,
                    "value": "35",
                    "vertical_alignment": "Baseline"
                },
                "type": "Feature"
            },
            {
                "geometry": {
                    "coordinates": [
                        508259.63,
                        221763.9
                    ],
                    "type": "Point"
                },
                "properties": {
                    "feature_id": 10026,
                    "graphic_type": "Text",
                    "height": 1000,
                    "horizontal_alignment": "Left",
                    "render_attributes": {
                        "render_level": "0",
                        "text_horizontal_alignment": "Left",
                        "text_vertical_alignment": "Baseline"
                    },
                    "rotation": 2.1307951881723985,
                    "value": "33",
                    "vertical_alignment": "Baseline"
                },
                "type": "Feature"
            },
            {
                "geometry": {
                    "coordinates": [
                        508257.48,
                        221762.54
                    ],
                    "type": "Point"
                },
                "properties": {
                    "feature_id": 10026,
                    "graphic_type": "Text",
                    "height": 1000,
                    "horizontal_alignment": "Left",
                    "render_attributes": {
                        "render_level": "0",
                        "text_horizontal_alignment": "Left",
                        "text_vertical_alignment": "Baseline"
                    },
                    "rotation": 2.1307951881723985,
                    "value": "31",
                    "vertical_alignment": "Baseline"
                },
                "type": "Feature"
            },
            {
                "geometry": {
                    "coordinates": [
                        508302.6,
                        221662.6
                    ],
                    "type": "Point"
                },
                "properties": {
                    "feature_id": 10026,
                    "graphic_type": "Text",
                    "height": 1000,
                    "horizontal_alignment": "Centre",
                    "render_attributes": {
                        "render_level": "0",
                        "text_horizontal_alignment": "Centre",
                        "text_vertical_alignment": "Baseline"
                    },
                    "rotation": 2.9999870521081,
                    "value": "21",
                    "vertical_alignment": "Baseline"
                },
                "type": "Feature"
            },
            {
                "geometry": {
                    "coordinates": [
                        508282.3,
                        221747.9
                    ],
                    "type": "Point"
                },
                "properties": {
                    "feature_id": 10026,
                    "graphic_type": "Text",
                    "height": 1000,
                    "horizontal_alignment": "Centre",
                    "render_attributes": {
                        "render_level": "0",
                        "text_horizontal_alignment": "Centre",
                        "text_vertical_alignment": "Baseline"
                    },
                    "rotation": 2.205960246778795,
                    "value": "27",
                    "vertical_alignment": "Baseline"
                },
                "type": "Feature"
            },
            {
                "geometry": {
                    "coordinates": [
                        508223.04,
                        221718.34
                    ],
                    "type": "Point"
                },
                "properties": {
                    "feature_id": 10026,
                    "graphic_type": "Text",
                    "height": 1000,
                    "horizontal_alignment": "Left",
                    "render_attributes": {
                        "render_level": "0",
                        "text_horizontal_alignment": "Left",
                        "text_vertical_alignment": "Baseline"
                    },
                    "rotation": 2.6231071472844465,
                    "value": "1 to 8",
                    "vertical_alignment": "Baseline"
                },
                "type": "Feature"
            },
            {
                "geometry": {
                    "coordinates": [
                        508222.34,
                        221738.99
                    ],
                    "type": "Point"
                },
                "properties": {
                    "feature_id": 10026,
                    "graphic_type": "Text",
                    "height": 1000,
                    "horizontal_alignment": "Left",
                    "render_attributes": {
                        "render_level": "0",
                        "text_horizontal_alignment": "Left",
                        "text_vertical_alignment": "Baseline"
                    },
                    "rotation": 0,
                    "value": "Hazelbury",
                    "vertical_alignment": "Baseline"
                },
                "type": "Feature"
            },
            {
                "geometry": {
                    "coordinates": [
                        508287.9,
                        221685.45
                    ],
                    "type": "Point"
                },
                "properties": {
                    "feature_id": 10026,
                    "graphic_type": "Text",
                    "height": 1000,
                    "horizontal_alignment": "Centre",
                    "render_attributes": {
                        "render_level": "0",
                        "text_horizontal_alignment": "Centre",
                        "text_vertical_alignment": "Baseline"
                    },
                    "rotation": -0.26892600687620144,
                    "value": "6",
                    "vertical_alignment": "Baseline"
                },
                "type": "Feature"
            },
            {
                "geometry": {
                    "coordinates": [
                        508266.35,
                        221750.95
                    ],
                    "type": "Point"
                },
                "properties": {
                    "feature_id": 10026,
                    "graphic_type": "Text",
                    "height": 1000,
                    "horizontal_alignment": "Centre",
                    "render_attributes": {
                        "render_level": "0",
                        "text_horizontal_alignment": "Centre",
                        "text_vertical_alignment": "Baseline"
                    },
                    "rotation": -0.9478083793148405,
                    "value": "1 to 6",
                    "vertical_alignment": "Baseline"
                },
                "type": "Feature"
            },
            {
                "geometry": {
                    "coordinates": [
                        508311.3,
                        221738.9
                    ],
                    "type": "Point"
                },
                "properties": {
                    "feature_id": 10026,
                    "graphic_type": "Text",
                    "height": 1000,
                    "horizontal_alignment": "Centre",
                    "render_attributes": {
                        "render_level": "0",
                        "text_horizontal_alignment": "Centre",
                        "text_vertical_alignment": "Baseline"
                    },
                    "rotation": -0.9829940636369674,
                    "value": "30",
                    "vertical_alignment": "Baseline"
                },
                "type": "Feature"
            },
            {
                "geometry": {
                    "coordinates": [
                        508238.3,
                        221682.4
                    ],
                    "type": "Point"
                },
                "properties": {
                    "feature_id": 10026,
                    "graphic_type": "Text",
                    "height": 1000,
                    "horizontal_alignment": "Centre",
                    "render_attributes": {
                        "render_level": "0",
                        "text_horizontal_alignment": "Centre",
                        "text_vertical_alignment": "Baseline"
                    },
                    "rotation": 2.773053769300268,
                    "value": "47",
                    "vertical_alignment": "Baseline"
                },
                "type": "Feature"
            }
        ],
        "properties": {
            "map_reference": "TL0821NW",
            "orientation_code": "P",
            "print_size": "A4",
            "scale": "500  ",
            "stamp_code_1": " ",
            "stamp_code_2": " ",
            "stamp_code_3": " ",
            "stamp_code_4": " ",
            "stamp_code_5": " ",
            "stamp_text_1": " ",
            "stamp_text_2": " ",
            "stamp_text_3": " ",
            "stamp_text_4": " ",
            "stamp_text_5": " "
        },
        "type": "FeatureCollection"
    },
    "references": [
        {
            "crs": {
                "properties": {
                    "name": "urn:ogc:def:crs:EPSG::27700"
                },
                "type": "name"
            },
            "features": [
                {
                    "geometry": {
                        "coordinates": [
                            [
                                508264.15,
                                221699.65
                            ],
                            [
                                508261.346,
                                221700.587
                            ]
                        ],
                        "type": "LineString"
                    },
                    "properties": {
                        "feature_id": 4002,
                        "graphic_type": "Poly Line",
                        "render_attributes": {
                            "edge_colour": 7,
                            "edge_style": 7,
                            "edge_thickness": 1,
                            "render_level": "0"
                        }
                    },
                    "type": "Feature"
                }
            ],
            "properties": {
                "colour_code": 2,
                "description": "black pecked line",
                "graphic_code": 2,
                "text_code": 0
            },
            "type": "FeatureCollection"
        },
        {
            "crs": {
                "properties": {
                    "name": "urn:ogc:def:crs:EPSG::27700"
                },
                "type": "name"
            },
            "features": [
                {
                    "geometry": {
                        "coordinates": [
                            [
                                [
                                    508264.15,
                                    221699.65
                                ],
                                [
                                    508266.35,
                                    221705.9
                                ],
                                [
                                    508263.58,
                                    221706.87
                                ],
                                [
                                    508261.346,
                                    221700.587
                                ],
                                [
                                    508264.15,
                                    221699.65
                                ]
                            ]
                        ],
                        "type": "Polygon"
                    },
                    "properties": {
                        "colour": 0,
                        "feature_id": 4011,
                        "graphic_type": "Bordered Polygon",
                        "render_attributes": {
                            "border_colour": 0,
                            "border_width": 0,
                            "exterior_edge_colour": 9,
                            "exterior_edge_thickness": 1,
                            "exterior_edge_thickness_units": "Pixels",
                            "fill_colour": 28,
                            "fill_style": 9,
                            "render_level": "0"
                        },
                        "width": 0
                    },
                    "type": "Feature"
                }
            ],
            "properties": {
                "colour_code": 5,
                "description": "tinted blue",
                "graphic_code": 15,
                "text_code": 0
            },
            "type": "FeatureCollection"
        }
    ]
}'
WHERE "title_number" = '#{title_number}';
eos

# calls the database conection - settings in the config.rb
# and executes the update title geometry sql
$db_connection.exec(update_title_geometry_sql)
end


# connect to the database and execute the sql (that deletes everything)
def delete_all_titles
  $db_connection.exec("DELETE FROM title_register_data;")
  $db_connection.exec("DELETE FROM title_numbers_uprns;")
end
