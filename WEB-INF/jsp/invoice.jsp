<%-- 
    Document   : invoice
    Created on : Mar 12, 2016, 11:15:47 PM
    Author     : sanjay prajapati
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Invoice</title>
        <link href="resource/dist/css/font-awesome.min.css" rel="stylesheet" />
        <style>
            * { margin: 0; padding: 0; }
            body { font-family : arial, sans-serif; font-size: 14px; }
            #page-wrap { width: 800px; height: 842px; margin: 0 auto; border:1px solid black;}
            #header { width: 100%; background: #C2DFFF; text-align: center; color: white; font: bold 15px Helvetica, Sans-Serif; text-decoration: uppercase; letter-spacing: 20px; padding: 0px 0px; }
            #container{ padding: 10px;}
            .pull-left {
                float: left !important;
            }
            .pull-right {
                float: right !important;
            }
            .sub-container{
                border:1px solid black;
                width:50%;
                margin: 20px auto;
                padding:10px;
            }
            th{
                padding:5px;
                border:1px solid black;
            }
            td{
                padding:5px;
                border:1px solid black;
            }
            .bold{
                font-weight: bold;
            }
            @media  print {
                #header{
                    background-color: #337ab7 !important;
                    -webkit-print-color-adjust: exact;
                }
            }
        </style>
    </head>
    <body>
        <div id="page-wrap">
            <div id="header">
                <img src="resource/dist/img/bill_header.png"/>
            </div>
            <div id="container">
                <!--div class="pull-right" style="margin-top: 10px;">
                    <p> તારીખ: <b></b> થી <b></b></p>
                </div-->
                <div style="clear:both; padding-top: 3em;">
                    <!--<p style="margin-left: 100px;">નામ: <span class="bold"><?php echo $this->user->name; ?></span></p>
                    <!--<p style="margin-left: 100px;">બ્રાંચ: <span class="bold"><?php if(isset($this->files[0])){ echo $this->files[0]->branch; } ?></span></p>-->

                    <p style="margin-left: 100px;"><font size="4"><span class="bold">Subject : File Tracking Maintenance Bill – Date 01/10/2015 to 31/12/2015</span></font></p><br /><br />
                    <p style="margin-left: 100px;"><font size="4"><span class="bold">Date : 12/03/2016</span><span class="bold" style="padding-left: 1em;">To : District Development Officer, <br /><span class="bold" style="padding-left: 11.1em;">District Panchayat Kheda, Nadiad</span></span></font></p>
                </div>

                <!--<h3 style="text-align:center;margin-top: 10px;margin-bottom: 10px;text-decoration:underline">શરૂ કરેલી ફાઈલોનું લીસ્ટ</h3>-->
                <!--h3 style="text-align:center;margin-top: 10px;margin-bottom: 10px;text-decoration:underline">ફાઈલોનું લીસ્ટ</h3-->
                <!--<p style="font-weight: bold;text-decoration: underline">Inbox </p>-->
                <div style="width: 770px">
                    <div style="width: 90px; float: left;">
                        <p style="writing-mode: tb-rl;"><font size="5"><span class="bold">Invoice [DP00910]</span></font></p>
                    </div>
                    <div style="width: 680px; float: right;">
                        <table width="100%" cellspacing="0" cellpadding="3" style="padding-top: 4em;">
                            <!--caption style="text-align: right;padding-right: 15px;">
                                <strong>Total Files (કુલ ફાઈલ):</strong>
                            </caption-->
                            <thead style="height: 5em;">
                                <tr>
                                    <th style="width: 2em;">S.R.N.O.</th>
                                    <th>Description</th>
                                    <th>QTY</th>
                                    <th style="width: 6em;">Unit Price</th>
                                    <th style="width: 6em;">Total</th>
                                </tr>        		        			
                            </thead>
                            <tbody>
                                <tr style="font-size: medium">
                                    <td>1</td>
                                    <td>File Tracking Maintenance Bill – Date 01/10/2015 to 31/12/2015</td>
                                    <td>1</td>
                                    <td>&#x20B9; 10,000</td>
                                    <td>&#x20B9; 10,000</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="3"><p style="float: right; font: bold;"><font size="3">Sub Total</font></p></td>
                                    <td>&#x20B9; 10,000</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="3"><p style="float: right"><font size="3">Grand Total</font></p></td>
                                    <td>&#x20B9; 10,000</td>
                                </tr>
                            </tbody>
                        </table>
                        <p style="float: right"><font size="2"><span class="bold">Rupees Ten Thousands Only</span></font></p><br /><br />
                        <p style="text-align: center"><font size="2"><span class="bold">* All kind of taxes are included in this invoice.</span></font></p><br /><br />
                        <p style="float: right; padding-top: 2em;"><font size="3"><span class="bold">Thank you for business with you!</span></font></p><br /><br />
                    </div>
                </div>
            </div>
            <div class="footer" style="margin-top: 35em;">
            <div class="text-center">
                <footer style="background: #fff; padding: 17px 0 17px 0;">
                    <div class="footer-card" id="footer-card">
                        <center><p style="color:#000;">http://rudraautomation.com/</p></center>
                    </div>
                </footer>
            </div>
        </div>
        </div>
    </body>
</html>
