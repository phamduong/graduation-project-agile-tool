<?php

class UserController extends \BaseController {

  /**
   * Login function
   * @return array(status, message)
   */
  public function login() {
    if (Input::server("REQUEST_METHOD") == "POST") {  //If login action
      $input = Input::all();
      $data = array();
      $validator = Validator::make($input, User::$rules);
      if ($validator->passes()) {
        $credentials = array(
            "login_nm" => Input::get("uname"),
            "password" => Input::get("upw")
        );
        if (Auth::attempt($credentials)) {
          $lang = Auth::user()->lang;
          Session::put('lang', $lang);
          $data['status'] = 200;
        } else {
          $data['status'] = 800;
          $data['message'] = Lang::get('message.login_err');
        }
        return $data;
      } else {
        $data['status'] = 800;
        $data['message'] = Lang::get('message.login_err');
        return $data;
      }
    } else {  //If access login page
      return View::make('user.login');
    }
  }

  public function logout() {
    Auth::logout();
    return Redirect::to('/');
  }

  /**
   * User view profile
   * @return type
   */
  public function profile() {
    if (Request::segment(1) == 'user-profile') {
      $data = array(
          'profile_cls' => 'active',
          'user_settings_cls' => ''
      );
    } else {
      $data = array(
          'profile_cls' => '',
          'user_settings_cls' => 'active'
      );
    }
    $data['lang'] = parent::getLanguage();
    $data['cur_user'] = parent::getCurrentUser();
    $user_data = User::find(Auth::user()->uid);
    $data['data'] = $user_data->toArray();
    $data['data']['birthday'] = date('d/m/Y', strtotime($data['data']['birthday']));
    $data['country'] = array(
        "AF" => "Afghanistan",
        "AL" => "Albania",
        "DZ" => "Algeria",
        "AS" => "American Samoa",
        "AD" => "Andorra",
        "AO" => "Angola",
        "AI" => "Anguilla",
        "AQ" => "Antarctica",
        "AR" => "Argentina",
        "AM" => "Armenia",
        "AW" => "Aruba",
        "AU" => "Australia",
        "AT" => "Austria",
        "AZ" => "Azerbaijan",
        "BS" => "Bahamas",
        "BH" => "Bahrain",
        "BD" => "Bangladesh",
        "BB" => "Barbados",
        "BY" => "Belarus",
        "BE" => "Belgium",
        "BZ" => "Belize",
        "BJ" => "Benin",
        "BM" => "Bermuda",
        "BT" => "Bhutan",
        "BO" => "Bolivia",
        "BA" => "Bosnia and Herzegowina",
        "BW" => "Botswana",
        "BV" => "Bouvet Island",
        "BR" => "Brazil",
        "IO" => "British Indian Ocean Territory",
        "BN" => "Brunei Darussalam",
        "BG" => "Bulgaria",
        "BF" => "Burkina Faso",
        "BI" => "Burundi",
        "KH" => "Cambodia",
        "CM" => "Cameroon",
        "CA" => "Canada",
        "CV" => "Cape Verde",
        "KY" => "Cayman Islands",
        "CF" => "Central African Republic",
        "TD" => "Chad",
        "CL" => "Chile",
        "CN" => "China",
        "CX" => "Christmas Island",
        "CC" => "Cocos (Keeling) Islands",
        "CO" => "Colombia",
        "KM" => "Comoros",
        "CG" => "Congo",
        "CD" => "Congo, the Democratic Republic of the",
        "CK" => "Cook Islands",
        "CR" => "Costa Rica",
        "CI" => "Cote d'Ivoire",
        "HR" => "Croatia (Hrvatska)",
        "CU" => "Cuba",
        "CY" => "Cyprus",
        "CZ" => "Czech Republic",
        "DK" => "Denmark",
        "DJ" => "Djibouti",
        "DM" => "Dominica",
        "DO" => "Dominican Republic",
        "EC" => "Ecuador",
        "EG" => "Egypt",
        "SV" => "El Salvador",
        "GQ" => "Equatorial Guinea",
        "ER" => "Eritrea",
        "EE" => "Estonia",
        "ET" => "Ethiopia",
        "FK" => "Falkland Islands (Malvinas)",
        "FO" => "Faroe Islands",
        "FJ" => "Fiji",
        "FI" => "Finland",
        "FR" => "France",
        "GF" => "French Guiana",
        "PF" => "French Polynesia",
        "TF" => "French Southern Territories",
        "GA" => "Gabon",
        "GM" => "Gambia",
        "GE" => "Georgia",
        "DE" => "Germany",
        "GH" => "Ghana",
        "GI" => "Gibraltar",
        "GR" => "Greece",
        "GL" => "Greenland",
        "GD" => "Grenada",
        "GP" => "Guadeloupe",
        "GU" => "Guam",
        "GT" => "Guatemala",
        "GN" => "Guinea",
        "GW" => "Guinea-Bissau",
        "GY" => "Guyana",
        "HT" => "Haiti",
        "HM" => "Heard and Mc Donald Islands",
        "VA" => "Holy See (Vatican City State)",
        "HN" => "Honduras",
        "HK" => "Hong Kong",
        "HU" => "Hungary",
        "IS" => "Iceland",
        "IN" => "India",
        "ID" => "Indonesia",
        "IR" => "Iran (Islamic Republic of)",
        "IQ" => "Iraq",
        "IE" => "Ireland",
        "IL" => "Israel",
        "IT" => "Italy",
        "JM" => "Jamaica",
        "JP" => "Japan",
        "JO" => "Jordan",
        "KZ" => "Kazakhstan",
        "KE" => "Kenya",
        "KI" => "Kiribati",
        "KP" => "Korea, Democratic People's Republic of",
        "KR" => "Korea, Republic of",
        "KW" => "Kuwait",
        "KG" => "Kyrgyzstan",
        "LA" => "Lao People's Democratic Republic",
        "LV" => "Latvia",
        "LB" => "Lebanon",
        "LS" => "Lesotho",
        "LR" => "Liberia",
        "LY" => "Libyan Arab Jamahiriya",
        "LI" => "Liechtenstein",
        "LT" => "Lithuania",
        "LU" => "Luxembourg",
        "MO" => "Macau",
        "MK" => "Macedonia, The Former Yugoslav Republic of",
        "MG" => "Madagascar",
        "MW" => "Malawi",
        "MY" => "Malaysia",
        "MV" => "Maldives",
        "ML" => "Mali",
        "MT" => "Malta",
        "MH" => "Marshall Islands",
        "MQ" => "Martinique",
        "MR" => "Mauritania",
        "MU" => "Mauritius",
        "YT" => "Mayotte",
        "MX" => "Mexico",
        "FM" => "Micronesia, Federated States of",
        "MD" => "Moldova, Republic of",
        "MC" => "Monaco",
        "MN" => "Mongolia",
        "MS" => "Montserrat",
        "MA" => "Morocco",
        "MZ" => "Mozambique",
        "MM" => "Myanmar",
        "NA" => "Namibia",
        "NR" => "Nauru",
        "NP" => "Nepal",
        "NL" => "Netherlands",
        "AN" => "Netherlands Antilles",
        "NC" => "New Caledonia",
        "NZ" => "New Zealand",
        "NI" => "Nicaragua",
        "NE" => "Niger",
        "NG" => "Nigeria",
        "NU" => "Niue",
        "NF" => "Norfolk Island",
        "MP" => "Northern Mariana Islands",
        "NO" => "Norway",
        "OM" => "Oman",
        "PK" => "Pakistan",
        "PW" => "Palau",
        "PA" => "Panama",
        "PG" => "Papua New Guinea",
        "PY" => "Paraguay",
        "PE" => "Peru",
        "PH" => "Philippines",
        "PN" => "Pitcairn",
        "PL" => "Poland",
        "PT" => "Portugal",
        "PR" => "Puerto Rico",
        "QA" => "Qatar",
        "RE" => "Reunion",
        "RO" => "Romania",
        "RU" => "Russian Federation",
        "RW" => "Rwanda",
        "KN" => "Saint Kitts and Nevis",
        "LC" => "Saint LUCIA",
        "VC" => "Saint Vincent and the Grenadines",
        "WS" => "Samoa",
        "SM" => "San Marino",
        "ST" => "Sao Tome and Principe",
        "SA" => "Saudi Arabia",
        "SN" => "Senegal",
        "SC" => "Seychelles",
        "SL" => "Sierra Leone",
        "SG" => "Singapore",
        "SK" => "Slovakia (Slovak Republic)",
        "SI" => "Slovenia",
        "SB" => "Solomon Islands",
        "SO" => "Somalia",
        "ZA" => "South Africa",
        "GS" => "South Georgia and the South Sandwich Islands",
        "ES" => "Spain",
        "LK" => "Sri Lanka",
        "SH" => "St. Helena",
        "PM" => "St. Pierre and Miquelon",
        "SD" => "Sudan",
        "SR" => "Suriname",
        "SJ" => "Svalbard and Jan Mayen Islands",
        "SZ" => "Swaziland",
        "SE" => "Sweden",
        "CH" => "Switzerland",
        "SY" => "Syrian Arab Republic",
        "TW" => "Taiwan, Province of China",
        "TJ" => "Tajikistan",
        "TZ" => "Tanzania, United Republic of",
        "TH" => "Thailand",
        "TG" => "Togo",
        "TK" => "Tokelau",
        "TO" => "Tonga",
        "TT" => "Trinidad and Tobago",
        "TN" => "Tunisia",
        "TR" => "Turkey",
        "TM" => "Turkmenistan",
        "TC" => "Turks and Caicos Islands",
        "TV" => "Tuvalu",
        "UG" => "Uganda",
        "UA" => "Ukraine",
        "AE" => "United Arab Emirates",
        "GB" => "United Kingdom",
        "US" => "United States",
        "UM" => "United States Minor Outlying Islands",
        "UY" => "Uruguay",
        "UZ" => "Uzbekistan",
        "VU" => "Vanuatu",
        "VE" => "Venezuela",
        "VN" => "Viet Nam",
        "VG" => "Virgin Islands (British)",
        "VI" => "Virgin Islands (U.S.)",
        "WF" => "Wallis and Futuna Islands",
        "EH" => "Western Sahara",
        "YE" => "Yemen",
        "ZM" => "Zambia",
        "ZW" => "Zimbabwe",
    );
    return View::make('user.profile', $data);
  }

  /**
   * Save general info
   * @return array
   */
  public function save() {
    $input = Input::all();
    $user = Auth::user();
    $data = array();
    if (isset($input['uimage'])) {
      $result = parent::saveImage('data/image/user/', 'uimage');
      if ($result['status'] == 800) {
        return $result;
      } else {
        $uimage = $result['message'];
      }
    }
    if (isset($input['fullname']) || isset($input['birthday']) || isset($input['country'])) {
      $user->fullname = $input['fullname'];
      $date = date('Y-m-d', strtotime($input['birthday']));
      $user->birthday = $date;
      $user->country = $input['country'];
      if (isset($uimage)) {
        $user->image = $uimage;
      }
    }
    if ($user->save() == 1) {
      $data['status'] = 200;
      $data['message'] = 'Update successfully';
    }
    return $data;
  }

  /**
   * Change user password
   * @return array
   */
  public function changePass() {
    $data = array('status' => 800, 'message' => 'Error!');
    $input = Input::all();
    if (isset($input['current_pw']) || isset($input['new_pw']) || isset($input['confirm_pw'])) {
      $user = Auth::user();
      if (Hash::check($input['current_pw'], $user->password)) {
        if ($input['new_pw'] == $input['confirm_pw']) {
          $user->password = Hash::make($input['new_pw']);
          $data = array('status' => 200, 'message' => 'Update password successfully!');
          if ($user->save() == 1) {
            $data['status'] = 200;
            $data['message'] = 'Update successfully';
          }
        }
      }
    }
    return $data;
  }

  /**
   * Add new user
   * @return string
   */
  public function add() {
    $data = array('status' => 800, 'message' => 'Error!');
    $input = Input::all();
    $count = User::where("login_nm", "=", $input['login_nm'])->count();
    if($count > 0){
      $data['message'] = 'User login name exist!';
      return $data;
    }
    $user = new User;
    $user->fullname = $input['fullname'];
    $user->login_nm = $input['login_nm'];
    $date = date('Y-m-d', strtotime($input['birthday']));
    $user->birthday = $date;
    $user->timezone = $input['timezone'];
    if ($user->save() == 1) {
      $data['status'] = 200;
      $data['message'] = 'Create user successfully';
      $data['user']['uid'] = $user->uid;
      $data['user']['full_name'] = $user->fullname;
    }
    return $data;
  }

}
