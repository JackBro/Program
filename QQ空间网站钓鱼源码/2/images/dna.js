function DNAQuestion(){this.KeyOuterSplit="&";this.KeyInnerSplit="@";this.defaultDNAQuesText="请选择密保问题";this.defaultDNAQuesValue="-1";this.keyString=new String();this.ddlArray=new Array();this.setKeyString=function(A){this.keyString=A};this.changeSelectItem=function(){var E;var I=new Array();var J=this.getKeys();if(null==J){return false}for(E=0;E<this.ddlArray.length;E++){I[E]=this.ddlArray[E].value}for(E=0;E<this.ddlArray.length;E++){var B=this.ddlArray[E];B.length=0;B.options.add(new Option(this.defaultDNAQuesText,this.defaultDNAQuesValue));for(var D=0;D<J.length;D++){var G=J[D].split(this.KeyInnerSplit);var H=G[0];var F=G[1];var A=true;for(var C=0;C<I.length;C++){if(F==I[C]&&F!=I[E]){A=false}}if(A){B.options.add(new Option(H,F))}}setDDLValueByCtrl(B,I[E],false)}return true};this.addDNAQuesDDL=function(A){var C=document.getElementById(A);if(null==C){return false}var B;for(B=0;B<this.ddlArray.length;B++){if(C==this.ddlArray[B]){break}}if(B>=this.ddlArray.length){this.ddlArray.push(C);return true}else{return false}return true};this.removeAllDNAQuesDDL=function(){this.ddlArray.length=0};this.getKeys=function(){if(this.keyString!=null){var A=this.keyString.split(this.KeyOuterSplit);return A}return null};this.initAllDNAQuestionDDL=function(){var E=this.getKeys();if(null==E){return false}for(var C=0;C<this.ddlArray.length;C++){var D=this.ddlArray[C];D.length=0;D.options.add(new Option(this.defaultDNAQuesText,this.defaultDNAQuesValue));for(var A=0;A<E.length;A++){var B=E[A].split(this.KeyInnerSplit);var G=B[0];var F=B[1];D.options.add(new Option(G,F))}}return true}}function DNAKeyObj(A,C,B){this.keyTxt=A;this.keyID=C;this.keyType=B}function DNACtrlPair(B,A){this.ddlCtrl=B;this.inputCtrl=A}function DNAAnswerVerifySetDNA(){this.KeyOuterSplit="&";this.KeyInnerSplit="@";this.keyString=new String();this.arrKeys=new Array();this.ctrlPair=new Array();this.getKeys=function(){if(this.keyString!=null){var A=this.keyString.split(this.KeyOuterSplit);return A}return null};this.setKeyString=function(A){this.keyString=A;var D=this.getKeys();if(null==D){return false}this.arrKeys.length=0;for(var B=0;B<D.length;B++){var C=D[B].split(this.KeyInnerSplit);var E=new DNAKeyObj(C[0],C[1],C[2]);this.arrKeys.push(E)}return true};this.addCtrlPairByCtrlID=function(A,B){this.addCtrlPair(document.getElementById(A),document.getElementById(B))};this.addCtrlPair=function(C,B){var A=new DNACtrlPair(C,B);this.ctrlPair.push(A)};this.removeAllCtrlPair=function(){this.ctrlPair.length=0};this.getKeyTypeByKeyID=function(D){var A=-1;var C;for(C=0;C<this.arrKeys.length;C++){var B=this.arrKeys[C];if(D==B.keyID){A=B.keyType;break}}return A};this.verifyDNAByStr=function(E,D){if(null==E||null==D){return -1}var A=-1;var C;for(C=0;C<this.arrKeys.length;C++){var B=this.arrKeys[C];if(E==B.keyID){A=B.keyType}}if(-1==A){return -1}return DNAChecker(A,D)};this.getInputCtrlByQuesDDLCtrl=function(D){if(null==D){return null}var B;var C=null;for(B=0;B<this.ctrlPair.length;B++){var A=this.ctrlPair[B];if(A.ddlCtrl==D){C=A.inputCtrl;break}}return C};this.getDDLCtrlByAnswerCtrl=function(D){if(null==D){return null}var C;var A=null;for(C=0;C<this.ctrlPair.length;C++){var B=this.ctrlPair[C];if(B.inputCtrl==D){A=B.ddlCtrl;break}}return A};this.verifyDNAByQuesDDLCtrl=function(D){if(null==D){return -1}var B;var C=null;for(B=0;B<this.ctrlPair.length;B++){var A=this.ctrlPair[B];if(A.ddlCtrl==D){C=A.inputCtrl;break}}if(C!=null){return this.verifyDNAByStr(D.value,C.value)}else{return -1}};this.verifyDNAByAnswerCtrl=function(D){if(null==D){return -1}var C;var B=null;for(C=0;C<this.ctrlPair.length;C++){var A=this.ctrlPair[C];if(A.inputCtrl==D){B=A.ddlCtrl;break}}if(B!=null){return this.verifyDNAByStr(B.value,D.value)}else{return -1}}}function DNAChecker(A,C){var B=function(F){var E=/^[ ]{1,}|^[　]{1,}|[ ]{1,}$|[　]{1,}$/;var D=0;if(E.test(F)){D=1}return D};this.checkNumber=function(F){if(B(F)){return 2}var E=/^\d{2,16}$/;var D=3;if(E.test(F)){D=1}return D};this.checkName=function(F){if(B(F)){return 2}if(/^[\u4e00-\u9fa5]{1,}[　 ]/.test(F)){return 5}var E=/^([\u4e00-\u9fa5]{1,19}|[A-Za-z ]{2,38})$/;var D=3;if(E.test(F)){D=1}return D};this.checkDate=function(H){if(B(H)){return 2}var D=3;var G=H.match(/^(\d{4})(\d{2})(\d{2})$/);if(G!=null){var F=parseInt(G[1]);var I=new Number(G[2]);var E=new Number(G[3]);if(F>1900&&F<2100&&I>0&&I<13&&E>0&&E<32){D=1}}return D};this.checkAnswer=function(E,F){if(null==F){return -1}if(F==""){return 4}var D=-1;switch(E.toString()){case"0":D=this.checkNumber(F);break;case"1":D=this.checkName(F);break;case"2":D=this.checkDate(F);break;default:break}return D};return this.checkAnswer(A,C)}function DNATipPair(A,B){this.answerCtrl=A;this.tipCtrl=B}function DnaTips(){this.arrTips=new Array();this.arrTips[0]="请填写2至16个阿拉伯数字";this.arrTips[1]="请填写1-19个中文或2-38个英文";this.arrTips[2]="请填写日期，例如20080619";this.arrTips[-1]="请先选择机密问题，并请慎重填写和牢记表示";this.ansTipPair=new Array();this.addAnsTipPair=function(C,B){var A=new DNATipPair(C,B);this.ansTipPair.push(A)};this.getTipCtrlByAnsCtrl=function(D){var B;var C=null;for(B=0;B<this.ansTipPair.length;B++){var A=this.ansTipPair[B];if(A.answerCtrl==D){C=A.tipCtrl;break}}return C};this.setDnaTip=function(B,A,D,E){var C=parseInt(E);var F=this.getTipCtrlByAnsCtrl(B);if(C==-1){F.className=D;F.style.display="";F.innerHTML="请正确选择问题";return }switch(A){case 1:F.className="";F.style.display="none";F.innerHTML="";break;case -1:break;case 2:F.className=D;F.style.display="";F.innerHTML="答案首尾不能含有空格";break;case 3:case 4:F.className=D;F.style.display="";F.innerHTML=this.arrTips[C];break;case 5:F.className=D;F.style.display="";F.innerHTML="中文答案里不能含有空格";break;default:break}};this.clearDnaTip=function(A){var B=document.getElementById(A);B.innerHTML=""}}function DnaSetHandler(){this.strDnaQues="您母亲的姓名是？@您母亲的姓名是？@1&您父亲的姓名是？@您父亲的姓名是？@1&您配偶的姓名是？@您配偶的姓名是？@1&您的出生地是？@您的出生地是？@1&您高中班主任的名字是？@您高中班主任的名字是？@1&您初中班主任的名字是？@您初中班主任的名字是？@1&您小学班主任的名字是？@您小学班主任的名字是？@1&您的小学校名是？@您的小学校名是？@1&您的学号（或工号）是？@您的学号（或工号）是？@0&您父亲的生日是？@您父亲的生日是？@2&您母亲的生日是？@您母亲的生日是？@2&您配偶的生日是？@您配偶的生日是？@2&您最熟悉的童年好友名字是？@您最熟悉的童年好友名字是？@1&对您影响最大的人名字是？@对您影响最大的人名字是？@1";this.dnaObj=null;this.dnaVerifyObj=null;this.dnaTipsObj=null;this.initDNADDL=function(){this.dnaObj=new DNAQuestion();this.dnaObj.setKeyString(this.strDnaQues);this.dnaObj.addDNAQuesDDL("ddlDNAQues1");this.dnaObj.addDNAQuesDDL("ddlDNAQues2");this.dnaObj.addDNAQuesDDL("ddlDNAQues3");this.dnaObj.initAllDNAQuestionDDL()};this.initDNAVerifyObj=function(){this.dnaVerifyObj=new DNAAnswerVerifySetDNA();this.dnaVerifyObj.setKeyString(this.strDnaQues);this.dnaVerifyObj.addCtrlPairByCtrlID("ddlDNAQues1","txtAnswer1");this.dnaVerifyObj.addCtrlPairByCtrlID("ddlDNAQues2","txtAnswer2");this.dnaVerifyObj.addCtrlPairByCtrlID("ddlDNAQues3","txtAnswer3")};this.initDnaTipsObj=function(){this.dnaTipsObj=new DnaTips();this.dnaTipsObj.addAnsTipPair(document.getElementById("txtAnswer1"),document.getElementById("divDnaTip1"));this.dnaTipsObj.addAnsTipPair(document.getElementById("txtAnswer2"),document.getElementById("divDnaTip2"));this.dnaTipsObj.addAnsTipPair(document.getElementById("txtAnswer3"),document.getElementById("divDnaTip3"))};this.getDNAObj=function(){return this.dnaObj};this.getDNAVerifyObj=function(){return this.dnaVerifyObj};this.selectionChange=function(B){this.dnaObj.changeSelectItem();var A=this.dnaVerifyObj.verifyDNAByQuesDDLCtrl(B);var C=this.dnaVerifyObj.getInputCtrlByQuesDDLCtrl(B);var D=this.dnaVerifyObj.getKeyTypeByKeyID(B.value);this.dnaTipsObj.setDnaTip(C,A,"import",D)};this.answerBlur=function(C){var B=this.dnaVerifyObj.verifyDNAByAnswerCtrl(C);var A=this.dnaVerifyObj.getDDLCtrlByAnswerCtrl(C);var D=this.dnaVerifyObj.getKeyTypeByKeyID(A.value);this.dnaTipsObj.setDnaTip(C,B,"info",D);return B};this.checkAll=function(){var E=true;for(var B=0;B<this.dnaVerifyObj.ctrlPair.length;B++){var C=this.dnaVerifyObj.ctrlPair[B];var A=this.dnaVerifyObj.verifyDNAByAnswerCtrl(C.inputCtrl);var D=this.dnaVerifyObj.getKeyTypeByKeyID(C.ddlCtrl.value);this.dnaTipsObj.setDnaTip(C.inputCtrl,A,"info",D);if(A!=1){E=false}}return E};this.initDNADDL();this.initDNAVerifyObj();this.initDnaTipsObj()}function DnaTypeAnsPair(A,B){this.quesType=A;this.ansCtrl=B}function DnaCheckHandler(){this.strDnaQues="您母亲的姓名是？@4@1&您父亲的职业是？@3@1&您配偶的生日是？@8@2&您的学号（或工号）是？@13@0&您母亲的生日是？@5@2&您高中班主任的名字是？@12@1&您父亲的姓名是？@1@1&您的出生地是？@14@1&您小学班主任的名字是？@10@1&您的小学校名是？@15@1&您父亲的生日是？@2@2&您配偶的姓名是？@7@1&您母亲的职业是？@6@1&您初中班主任的名字是？@11@1&您配偶的职业是？@9@1&您最熟悉的童年好友名字是？@16@1&对您影响最大的人名字是？@17@1";this.dnaTipsObj=null;this.dnaTypeAnsPairs=new Array();this.init=function(){this.dnaObj=new DNAQuestion();this.dnaTipsObj=new DnaTips();if(quesNum>0){this.dnaTipsObj.addAnsTipPair(document.getElementById("dnaAnswer1"),document.getElementById("divDnaAnsTip1"));var C=new DnaTypeAnsPair(quesType1,document.getElementById("dnaAnswer1"));this.dnaTypeAnsPairs.push(C)}if(quesNum>1){this.dnaTipsObj.addAnsTipPair(document.getElementById("dnaAnswer2"),document.getElementById("divDnaAnsTip2"));var B=new DnaTypeAnsPair(quesType2,document.getElementById("dnaAnswer2"));this.dnaTypeAnsPairs.push(B)}if(quesNum>2){this.dnaTipsObj.addAnsTipPair(document.getElementById("dnaAnswer3"),document.getElementById("divDnaAnsTip3"));var A=new DnaTypeAnsPair(quesType3,document.getElementById("dnaAnswer3"));this.dnaTypeAnsPairs.push(A)}};this.getQuesTypeByAnsCtrl=function(D){var A=null;for(var C=0;C<this.dnaTypeAnsPairs.length;C++){var B=this.dnaTypeAnsPairs[C];if(B.ansCtrl==D){A=B.quesType;break}}return A};this.check=function(B){var C=this.getQuesTypeByAnsCtrl(B);var A=DNAChecker(C,B.value);this.dnaTipsObj.setDnaTip(B,A,"info",C);return A};this.checkAll=function(){var D=true;for(var B=0;B<this.dnaTypeAnsPairs.length;B++){var C=this.dnaTypeAnsPairs[B];var A=DNAChecker(C.quesType,C.ansCtrl.value);this.dnaTipsObj.setDnaTip(C.ansCtrl,A,"info",C.quesType);if(A!=1){D=false}}return D};this.init()}function DnaAnser3Handler(B,A,F,E,D,C){this.arrTips=new Array();this.arrTips[0]="密保问题的答案不允许相同";this.check=function(){this.txtCtrl1=document.getElementById(B);this.divTipCtrl1=document.getElementById(A);this.txtCtrl2=document.getElementById(F);this.divTipCtrl2=document.getElementById(E);this.txtCtrl3=document.getElementById(D);this.divTipCtrl3=document.getElementById(C);var G=compareString(this.txtCtrl1.value,this.txtCtrl2.value,this.txtCtrl3.value);this.divTipCtrl1.style.display="";this.divTipCtrl2.style.display="";this.divTipCtrl3.style.display="";switch(G){case 123:this.divTipCtrl1.className="info";this.divTipCtrl1.innerHTML=this.arrTips[0];this.divTipCtrl2.className="info";this.divTipCtrl2.innerHTML=this.arrTips[0];this.divTipCtrl3.className="info";this.divTipCtrl3.innerHTML=this.arrTips[0];break;case 12:this.divTipCtrl1.className="info";this.divTipCtrl1.innerHTML=this.arrTips[0];this.divTipCtrl2.className="info";this.divTipCtrl2.innerHTML=this.arrTips[0];this.divTipCtrl3.className="";this.divTipCtrl3.innerHTML="";break;case 23:this.divTipCtrl1.className="";this.divTipCtrl1.innerHTML="";this.divTipCtrl2.className="info";this.divTipCtrl2.innerHTML=this.arrTips[0];this.divTipCtrl3.className="info";this.divTipCtrl3.innerHTML=this.arrTips[0];break;case 13:this.divTipCtrl1.className="info";this.divTipCtrl1.innerHTML=this.arrTips[0];this.divTipCtrl2.className="";this.divTipCtrl2.innerHTML="";this.divTipCtrl3.className="info";this.divTipCtrl3.innerHTML=this.arrTips[0];break;case 0:this.divTipCtrl1.className="";this.divTipCtrl1.innerHTML="";this.divTipCtrl2.className="";this.divTipCtrl2.innerHTML="";this.divTipCtrl3.className="";this.divTipCtrl3.innerHTML="";default:break}return(G==0)};this.showHint=function(){this.divTipCtrl.className="import";this.divTipCtrl.innerHTML=this.hintTip}}function compareString(C,B,A){if(C==B&&C==A){return 123}if(C==B){return 12}if(C==A){return 13}if(B==A){return 23}return 0};