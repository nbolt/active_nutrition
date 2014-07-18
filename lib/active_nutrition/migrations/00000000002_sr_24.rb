# encoding: UTF-8

module ActiveNutrition
  module Migrations
    class Sr24 < ActiveRecord::Migration
      def self.up
        create_table "abbrev", :primary_key => "ndb_no", :force => true do |t|
          t.string  "shrt_desc",                  :limit => 60
          t.float   "water"
          t.integer "energ_kcal"
          t.float   "protein"
          t.float   "lipid_tot"
          t.float   "ash"
          t.float   "carbohydrt"
          t.float   "fiber_td"
          t.float   "sugar_tot",                  :default => 0.0
          t.integer "calcium"
          t.float   "iron"
          t.float   "magnesium",                  :default => 0.0
          t.integer "phosphorus"
          t.integer "potassium"
          t.integer "sodium"
          t.float   "zinc",                       :default => 0.0
          t.float   "copper",                     :default => 0.0
          t.float   "manganese",                  :default => 0.0
          t.float   "selenium",                   :default => 0.0
          t.float   "vit_c"
          t.float   "thiamin",                    :default => 0.0
          t.float   "riboflavin",                 :default => 0.0
          t.float   "niacin",                     :default => 0.0
          t.float   "panto_acid",                 :default => 0.0
          t.float   "vit_b6",                     :default => 0.0
          t.float   "folate_tot",                 :default => 0.0
          t.float   "folic_acid",                 :default => 0.0
          t.float   "food_folate",                :default => 0.0
          t.float   "folate_dfe",                 :default => 0.0
          t.float   "choline_tot",                :default => 0.0
          t.float   "vit_b12",                    :default => 0.0
          t.integer "vit_a_iu"
          t.float   "vit_a_rae",                  :default => 0.0
          t.float   "retinol",                    :default => 0.0
          t.float   "alpha_carot",                :default => 0.0
          t.float   "beta_carot",                 :default => 0.0
          t.float   "beta_crypt",                 :default => 0.0
          t.float   "lycopene",                   :default => 0.0
          t.float   "lut+zea",                    :default => 0.0
          t.float   "vit_e",                      :default => 0.0
          t.float   "vit_d_mcg",                  :default => 0.0
          t.float   "vivit_d_iu",                 :default => 0.0
          t.float   "vit_k",                      :default => 0.0
          t.float   "fa_sat"
          t.float   "fa_mono",                    :default => 0.0
          t.float   "fa_poly",                    :default => 0.0
          t.integer "cholestrl"
          t.float   "gmwt_1"
          t.string  "gmwt_desc1",                 :limit => 120
          t.float   "gmwt_2",                     :default => 0.0
          t.string  "gmwt_desc2",                 :limit => 120
          t.integer "refuse_pct"
        end

        add_index "abbrev", ["folic_acid"], :name => "abbrev_folic_acid_index"
        add_index "abbrev", ["panto_acid"], :name => "abbrev_panto_acid_index"

        create_table "data_src", :id => false, :primary_key => "datasrc_id", :force => true do |t|
          t.integer "datasrc_id"
          t.string "authors"
          t.string "title"
          t.string "year",        :limit => 4
          t.string "journal",     :limit => 135
          t.string "vol_city",    :limit => 16
          t.string "issue_state", :limit => 5
          t.string "start_page",  :limit => 5
          t.string "end_page",    :limit => 5
        end

        add_index "data_src", ["datasrc_id"], :name => "datasrc_id_index"

        create_table "datsrcln", :id => false, :primary_key => "ndb_no", :force => true do |t|
          t.integer "ndb_no",                  :null => false
          t.integer "nutr_no",                 :null => false
          t.string  "datasrc_id", :limit => 6, :null => false
        end

        add_index "datsrcln", ["ndb_no", "nutr_no", "datasrc_id"], :name => "datsrcln_ndb_no_nutr_no_datasrc_id_index", :unique => true

        #create_table "deriv_cd", :primary_key => "deriv_cd", :force => true do |t|
        create_table "deriv_cd", :id => false, :primary_key => "deriv_cd", :force => true do |t|
          t.integer "deriv_cd"
          t.string "deriv_desc", :limit => 120
        end

        add_index "deriv_cd", ["deriv_cd"], :name => "deriv_cd_deriv_cd_index"

        create_table "fd_group", :primary_key => "fdgrp_cd", :force => true do |t|
          t.string "fdgrp_desc", :limit => 60
        end

        create_table "food_des", :primary_key => "ndb_no", :force => true do |t|
          t.string  "fdgrp_cd",    :limit => 4
          t.string  "long_desc",   :limit => 200
          t.string  "shrt_desc",   :limit => 60
          t.string  "comname",     :limit => 100
          t.string  "manufacname", :limit => 65
          t.string  "survey",      :limit => 1
          t.string  "ref_desc",    :limit => 135
          t.integer "refuse"
          t.string  "sciname",     :limit => 65
          t.float   "n_factor"
          t.float   "pro_factor"
          t.float   "fat_factor"
          t.float   "cho_factor"
        end

        create_table "footnote", :id => false, :primary_key => "footnt_no", :force => true do |t|
          t.integer "ndb_no",      :null => false
          t.integer "footnt_no"
          t.string  "footnot_typ", :limit => 1
          t.integer "nutr_no"
          t.string  "footnot_txt", :limit => 200
        end

        create_table "langdesc", :id => false, :primary_key => "factor_code", :force => true do |t|
          t.string "factor_code"
          t.string "description", :limit => 250
        end

        add_index "langdesc", ["factor_code"], :name => "langdesc_factor_code_index"

        create_table "langual", :id => false, :primary_key => "ndb_no", :force => true do |t|
          t.integer "ndb_no", :null => false
          t.string  "factor_code", :limit => 6, :null => false
        end

        add_index "langual", ["ndb_no", "factor_code"], :name => "langual_ndb_no_factor_code_index", :unique => true

        create_table "nut_data", :id => false, :primary_key => "ndb_no", :force => true do |t|
          t.integer "ndb_no",        :null => false
          t.integer "nutr_no",       :null => false
          t.float   "nutr_val"
          t.integer "num_data_pts"
          t.float   "std_error"
          t.string  "src_cd",        :limit => 2
          t.string  "deriv_cd",      :limit => 4
          t.integer "ref_ndb_no"
          t.string  "add_nutr_mark", :limit => 1
          t.integer "num_studies"
          t.float   "min"
          t.float   "max"
          t.float   "df"
          t.float   "low_eb"
          t.float   "up_eb"
          t.string  "stat_cmt",      :limit => 10
          t.date    "addmod_date"
          t.string  "cc"
        end

        add_index "nut_data", ["ndb_no", "nutr_no"], :name => "nut_data_ndb_no_nutr_no_index", :unique => true
        add_index "nut_data", ["num_data_pts"], :name => "nut_data_num_data_pts_index"
        add_index "nut_data", ["num_studies"], :name => "num_studies_index"

        create_table "nutr_def", :primary_key => "nutr_no", :force => true do |t|
          t.string "units",    :limit => 7
          t.string "tagname",  :limit => 20
          t.string "nutrdesc", :limit => 60
          t.string "num_dec",  :limit => 1
          t.float  "sr_order"
        end

        add_index "nutr_def", ["num_dec"], :name => "num_dec_index"

        create_table "src_cd", :primary_key => "src_cd", :force => true do |t|
          t.string "srccd_desc", :limit => 60
        end

        create_table "weight", :id => false, :primary_key => "ndb_no", :force => true do |t|
          t.integer "ndb_no",       :null => false
          t.integer "seq",          :null => false
          t.float   "amount"
          t.string  "msre_desc",    :limit => 80
          t.float   "gm_wgt"
          t.integer "num_data_pts"
          t.float   "std_dev"
        end

        add_index "weight", ["ndb_no", "seq"], :name => "weight_ndb_no_seq_index", :unique => true
        add_index "weight", ["num_data_pts"], :name => "weight_num_data_pts_index"
      end

      def self.down
        drop_table "abbrev"
        drop_table "data_src"
        drop_table "datsrcln"
        drop_table "deriv_cd"
        drop_table "fd_group"
        drop_table "food_des"
        drop_table "footnote"
        drop_table "langdesc"
        drop_table "langual"
        drop_table "nut_data"
        drop_table "nutr_def"
        drop_table "src_cd"
        drop_table "weight"
      end
    end
  end
end