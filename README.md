# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_ruby         | string | null: false               |
| last_ruby          | string | null: false               |
| birth_date         | date   | null: false               |

### Association

* has_many :items
* has_many :purchase_records

## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| content         | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| shipping_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| derivery_id     | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | reference  | null: false foreign_key: true  |

### Association

* belongs_to :user
* has_one :purchase_record


## purchase_records テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one :shipping_info


## shipping_infos テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_number         | string     | null:false                     |
| prefecture_id       | integer    | null:false                     |
| purchaser_city      | string     | null:false                     |
| purchaser_address   | string     | null:false                     |
| purchaser_building  | string     |                                |
| telephone_number    | string     | null:false                     |
| purchase_record     | references | null: false, foreign_key: true |

### Association

＊ belongs_to :purchase_record

const pay = () => {
  Payjp.setPublicKey("pk_test_f1bce11d662890accd4a4d63");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order[number]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
      cvc: formData.get("order[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }

      document.getElementById("order_number").removeAttribute("name");
      document.getElementById("order_cvc").removeAttribute("name");
      document.getElementById("order_exp_month").removeAttribute("name");
      document.getElementById("order_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);
