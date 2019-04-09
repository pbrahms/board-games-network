<?php
$vote = $_REQUEST['vote'];

//get content of textfile
$filename = "poll_result.txt";
$content = file($filename);

//put content in array
$array = explode("||", $content[0]);
$Scrabble = $array[0];
$Monopoly = $array[1];
$Catan = $array[2];
$Qwirkle = $array[3];
$Risk = $array[4];
$Axis = $array[5];
$Clue = $array[6];
$Battleship = $array[7];
$Jenga = $array[8];
$Trivial = $array[9];


if ($vote == 0) {
  $Scrabble = $Scrabble + 1;
}
if ($vote == 1) {
  $Monopoly = $Monopoly + 1;
}
if ($vote == 2) {
  $Catan = $Catan + 1;
}
if ($vote == 3) {
  $Qwirkle = $Qwirkle + 1;
}
if ($vote == 4) {
  $Risk = $Risk + 1;
}
if ($vote == 5) {
  $Axis = $Axis + 1;
}
if ($vote == 6) {
  $Clue = $Clue + 1;
}
if ($vote == 7) {
  $Battleship = $Battleship + 1;
}
if ($vote == 8) {
  $Jenga = $Jenga + 1;
}
if ($vote == 9) {
  $Trivial = $Trivial + 1;
}

//insert votes to txt file
$insertvote = $Scrabble."||".$Monopoly."||".$Catan."||".$Qwirkle."||".$Risk."||".$Axis."||".$Clue."||".$Battleship."||".$Jenga."||".$Trivial;
$fp = fopen($filename,"w");
fputs($fp,$insertvote);
fclose($fp);
?>
<style>
    .result{
        display: flex;
        flex-wrap: wrap;
        margin: 0;   
    }
    .rezultat{
        padding-left: 25px;
        font-size: 15px;
    }
    .tabela{
        padding: 5px;
    }
    
</style>
<div class="result">
<h2 style="text-align:'center';" >Results:</h2>
<table class="tabela">
<tr>
<td>Scrabble:</td>
<td class="rezultat">
<img
<?php echo(100*round($Scrabble/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>
>
<?php echo(100*round($Scrabble/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>%
</td>
</tr>
<tr>
<td>Monopoly:</td>
<td class="rezultat">
<img
<?php echo(100*round($Monopoly/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>
height='0'>
<?php echo(100*round($Monopoly/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>%
</td>
</tr>
<tr>
<td>Catan:</td>
<td class="rezultat">
<img
<?php echo(100*round($Catan/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>
>
<?php echo(100*round($Catan/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>%
</td>
</tr>
<tr>
<td>Qwirkle:</td>
<td class="rezultat">
<img 
<?php echo(100*round($Qwirkle/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>
>
<?php echo(100*round($Qwirkle/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>%
</td>
</tr>
<tr>
<td>Risk:</td>
<td class="rezultat">
<img 
<?php echo(100*round($Risk/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>
>
<?php echo(100*round($Risk/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>%
</td>
</tr>
<tr>
<td>Axis:</td>
<td class="rezultat">
<img 
<?php echo(100*round($Axis/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>
>
<?php echo(100*round($Axis/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>%
</td>
</tr>
<tr>
<td>Clue (Cluedo):</td>
<td class="rezultat">
<img
<?php echo(100*round($Clue/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>
>
<?php echo(100*round($Clue/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>%
</td>
</tr>
<tr>
<td>Battleship:</td>
<td class="rezultat">
<img
<?php echo(100*round($Battleship/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>
>
<?php echo(100*round($Battleship/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>%
</td>
</tr>
<tr>
<td>Jenga:</td>
<td class="rezultat">
<img
<?php echo(100*round($Jenga/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>
>
<?php echo(100*round($Jenga/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>%
</td>
</tr>
<tr>
<td>Trivial:</td>
<td class="rezultat">
<img
<?php echo(100*round($Trivial/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>
>
<?php echo(100*round($Trivial/($Catan+$Qwirkle+$Monopoly+$Scrabble+$Risk+$Axis+$Clue+$Battleship+$Jenga+$Trivial),2)); ?>%
</td>
</tr>
</table>
    </div>