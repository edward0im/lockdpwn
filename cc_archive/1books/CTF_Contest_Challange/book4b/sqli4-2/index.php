<?php
  /*================================================
   このサンプルは脆弱性を含んでいます。
   流用などはお控えください。
  =================================================*/
  
  ini_set("display_errors", 1);

  function my_filter_input($input, $name) {
    $i = filter_input($input, $name);
    if ($i) return $i;
    else return "";
  }

  function escape($str) {
    return htmlspecialchars($str, ENT_QUOTES, "UTF-8");
  }

  function mask($str) {
    return preg_replace("/./", "*", $str);
  }

  $search = my_filter_input(INPUT_GET, "search");

  if ($search) {
    $db = new mysqli("localhost", "root", "password", "book4b");
    $sql = "SELECT username FROM users WHERE username='{$search}'";
    $result = $db->query($sql);
  }
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>SQLi 4-2</title>
  <style>
    body {
      padding: 20px;
    }

    table {
      border-collapse: collapse;
    }

    th, td {
      border-top: solid 1px #000000;
      border-bottom: solid 1px #000000;
      padding: 3px;
      padding-left: 10px;
      padding-right: 10px;
    }

    td {
      border: none;
    }

    tr:nth-child(even) {
      background-color: #DDDDDD;
    }

    input[type=text] {
      width: 400px;
      font-size: 20px;
    }
  </style>
</head>
<body>
  <h1>SQLi 4-2</h1>
  <hr>
  <h2>ユーザ検索</h2>
  <form>
    <label>ユーザ名：<input type="text" name="search" placeholder="testuser" value="<?= escape($search) ?>" autofocus></label>
    <input type="submit" value="検索">
  </form>
<?php
  if ($search):
?>
  <h2>結果</h2>
  <table>
    <thead>
      <tr>
        <th>USERNAME</th>
      </tr>
    </thead>
    <tbody>
<?php
    while($row = $result->fetch_assoc()):
?>
      <tr>
        <td><?= escape($row["username"]) ?></td>
      </tr>
    </tbody>
<?php
    endwhile;
?>
<?php
  endif;
?>
</body>
</html>
