#!/bin/perl


$htmlbody=<<BODY;
<body bgcolor=\"#ECF8FF\" link=\"#000050\"   vlink=\"#000050\"><center>
</center>
BODY


$thetable=<<THETABLE;
<center>
<table width=85% bgcolor=#ccddcc border=1 cellspacing=0 > 
<tr>

<td align=center><a href=/chilibot/index.html target=_top>
	New Session</a></td>

<td align=center><a href=/cgi-bin/chilibot/chilibot.cgi?PREV=t target=_top>
Saved Sessions</a></td>

</table>
</center>
THETABLE

#<td align=center><a href=/cgi-bin/chilibot/chilibot.cgi?LOGOUT=t target=_top> Log Out</a></td>



$popup=<<POPUP;
	<SCRIPT LANGUAGE="JavaScript">
		<!-- Begin
			function popUp(URL) {
				day = new Date();
				id = day.getTime();
				eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width=600,height=400,left = 20,top = 20');");
			}
		// End -->
	</script>
POPUP

$aiseeheadcomm=<<COM;
// This is the Aisee source file used to generate the network image.
// AiSee can be downloaded from http://www.abstract-interpretation.com/aisee/ 
// Save this file in text format will allow you to view and manipulate the graph 
// generated by Chilibot for archive or publication purposes. However, links  
// are not preserved. 

// We do not provide support for using AiSee.
COM

$aiseehead[0]=<<AISEE0;
graph:{
	layoutalgorithm: forcedir
	colorentry 56: 224 255 224
	colorentry 35: 250 250 250
	color: 35
    gravity        : 0.0
    repulsion      : 80
    attraction     : 30
    magnetic_field1: polar
	magnetic_field2: circular
	tempscheme   : 8 
	tempmin		: 19
	tempmax: 30
	border x : 50
	border y : 50
    node.borderwidth:  1
	arrowmode  : free 
AISEE0

$aiseehead[3]=<<AISEE1;
graph:{
	colorentry 35: 250 250 250
	color: 35
	colorentry 56: 224 255 224
	layoutalgorithm:tree 
    node.borderwidth:  1
	arrowmode  : free 
AISEE1

$aiseehead[1]=<<AISEE2;
graph:{
	layoutalgorithm: dfs 
	finetuning: yes
	colorentry 40: 244 255 244
	colorentry 35: 250 250 250
	color: 35
	colorentry 32: 230 230 230 
	yspace:20
	xspace:20
	edge.arrowsize: 8
	splines: no
	portsharing:no 
	node.borderwidth: 1
	arrowmode: fixed
	
AISEE2
$aiseehead[2]=<<AISEE3;
graph:{
manhattan_edges: yes
scaling: maxspect
yspace:20 
xspace:25
colorentry 56: 224 255 224
colorentry 35: 250 250 250
color: 35
node.borderwidth: 1
arrowmode: fixed
portsharing:no 
AISEE3


$aiseehead[4]=<<AISEE4;
graph:{
	layoutalgorithm: maxdepthslow
	splinefactor\t:\t80
	finetuning	    : yes 
	crossingphase2      : yes 
	crossingoptimization: yes 
	crossingweight      : bary
	splines 	    :no 
	colorentry 56: 224 255 224
	colorentry 35: 250 250 250
	color: 35
	borderwidth:1
	xspace:20
	yspace:40
	xbase: 0
	ybase: 0
	portsharing:no 
	edge.thickness:3
	
AISEE4

$aiseecolor=<<COLOR;
	colorentry 60: 32 255 32
	colorentry 59: 80 255 80
	colorentry 58: 128 255 128
	colorentry 57: 176 255 176
	colorentry 56: 224 255 224
	colorentry 55: 224 224 224
	colorentry 54: 255 224 224
	colorentry 53: 255 176 176
	colorentry 52: 255 128 128
	colorentry 51: 255 80 80 
	colorentry 50: 255 32 32

COLOR

$aiseehead[5]=<<AISEE5;
graph:{
	colorentry 35: 255 255 255
	color: 35
	yspace:35
	xspace:20
	splines:no 
	portsharing:no 
	node.borderwidth: 1
	arrowmode: fixed

AISEE5

$htmlcss = <<HTMLCSS;
	<html>
	<META NAME="expires" CONTENT="0"> 
	<head> 
	<title>Chilibot: Mining PubMed for Relationships</title>
<link rel=stylesheet href="/chilibot.css" type="text/css">
</head>
HTMLCSS


$htmlrefresh = <<HTMLREF;
	<html>
	<head> 
	<title>Chilibot: Mining PubMed for Relationships</title>
<link rel=stylesheet href="/chilibot.css" type="text/css">
<meta HTTP-EQUIV="REFRESH" content=2; url="/chilibot/$user/$name/index.html">
</head>
HTMLREF


$htmlhead= <<HTMLHEAD;
	<html>
	<head> 
	<title>Chilibot: Mining PubMed for Relationships</title>
	<style type="text/css">
	<!-- A:link { text-decoration: underline;} 
	      A:visited { text-decoration:underline;} 
	      A:hover { color: #3300ff; text-decoration: none;}
	 --> 
	 </style>  
	 </head> 
	 <body bgcolor="#ECF8FF" link="#000050"   vlink="#000050">	 
HTMLHEAD


$intro= <<INTRO;

<html>
<head> 
	<link rel=stylesheet href="/chilibot.css" type="text/css">
</head>
<title>Chilibot: Mining PubMed for Relationships</title>
<style type="text/css">
 
<h3>Legends</h3><p>
A Chilibot map contains many interactive elements. <b>Clicking on the boxes </b> will open a portal site for the represented term. <b>Clicking on the circles/rhomboids</b>  will bring up sentences describing the relationships.  

 <p>
 <table>
 <tr><td bgcolor="#ecf8ff"><img src=/chilibot/images/single.node.png align=middle>  &emsp; Queried terms<br>
 <img src=/chilibot/images/green.png> Interactive relationship (stimulative)<br>
 <img src=/chilibot/images/red.png> Interactive relationship (inhibitory) <br>
 <img src=/chilibot/images/gold.png> Interactive relationship (both stimulative and inhibitory) <br>
 <img src=/chilibot/images/grey.png> Interactive relationship (neutral) <br>
 <img src=/chilibot/images/grey.equal.png> Non-interactive (i.e. parallel) relationship<br>
 <img src=/chilibot/images/grey.abs.png> Abstract co-occurrence only<br>
 </table>
<p>
 <b>*</b> The numbers in the circles indicate the amount of abstracts analyzed.  

INTRO


$frame=<<FRAME;
	<html>
	<META NAME="expires" CONTENT="0"> 
	<title>Chilibot .=. </title> 
	<frameset border=2  cols="50%, 50%">  
	<frame  
        	name ="left"  
       	 	SRC="html/left.html"  
        	Scrolling=auto> 
	<frame
		name ="right"  
        	SRC="/legend.html"  
        	scrolling=auto>  
  
	</frameset>  
FRAME

$popup=<<POPUP;
	<SCRIPT LANGUAGE="JavaScript">
		<!-- Begin
			function popUp(URL) {
				day = new Date();
				id = day.getTime();
				eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width=600,height=400,left = 20,top = 20');");
			}
		// End -->
	</script>
POPUP


$note=<<NOTE;

	<b>Notes on the sentences:</b><p>
	The sentences in the text window have been processed to facilitate the reading. Modifications include: <p>
	1) acronyms are replaced by the full names as found in the abstract.<p>
	2) synonyms of the genes of interest are replaced by their symbols.<p>
	3) other minor moficiations<p>
	<b>When in doubt, always click on the PMID link to see the original text.</b><p>	
	<a href="javascript:self.close()">Close Window</a>
	
NOTE

$edit=<<EDIT;	 
	This is a planned function and will be available in the next version of Chilibot. <p>
	<a href="javascript:self.close()">Close Window
EDIT

$style2=<<STYLE;
	<style>
		<!--
		#pr {font-size: 10%; color:white}  
		pr {font-size: 60%; color:grey} 
		vb {color:#333399;background-color:#ccffcc}  
		ga {color:black;background-color:#FFFFAA} 
		#gb {color:black;background-color:#ddddff}  
		note: pr=parsing; vb=verb; ga=gene a; gb=gene b;
		-->
	</style>
STYLE


$figlet=<<FIGLET;
	  <center><pre><font color=black>
      _       _   _           _   
  ___| |__ (_) (_) |__   ___ | |_ 
 / __| '_ \\| | | | '_ \\ / <font color=deeppink>_</font> \\| __|
| (__| | | | | | | |_) | <font color=deeppink>(_)</font> | |_ 
 \\___|_| |_|_|_|_|_.__/ \\___/ \\__| </font></pre></center>
FIGLET

$slogan="<center><font color=gray face=\"helvetica\" size=+1><b>A unique engine for that special <font color=lightslategray>relationship</font></b></font><p></center>";

