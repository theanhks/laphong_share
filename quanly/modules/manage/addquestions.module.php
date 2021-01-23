<?php
/*************************************************************************
Add category
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                  
Last updated: 15/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/questions.class.php");
include_once(ROOT_PATH."classes/dao/subjects.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');

$templateFile = "manageaddquestions.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$subjects = new Subjects();
$questions = new Questions();
$infoClass = 'infoText';
$searchStatus = $request->element('searchStatus','-1');
$searchTerms=$request->element('searchTerms','');
$searchLang = $request->element('searchLang','-1');
$page= $request->element('page',1);
$people = $request->element('people','');
$lang = $request->element('addLang','');
$address = $request->element('address','');
$tel = $request->element('tel',0);
$email = $request->element('email','');
$question = $request->element('question','');
$answers = $request->element('answers','');
$file_upload = $request->element('file_upload','');
$status = $request->element('status','');
$position = $request->element('position',0);
$sId = $request->element('sId',0);
$addslug = $request->element('slug','');

if($_POST) {

	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	 $validate = validateData($request);
	if($validate == '') {
		//$addslug=removeSign($addslug);
		$questionsInfo = new QuestionInfo($sId,$addslug,$people,$lang,$address,$tel,$email,$question,$answers,date("Y-m-d H:i:s"),$file_upload,$status,$position);
		$fields = array('sid'=>$questionsInfo->getSId(),
					'slug'=>$questionsInfo->getSlug(),
					'people'=>$questionsInfo->getPeople(),
					'lang'=>$questionsInfo->getLang(),
					'address'=>$questionsInfo->getAddress(),
					'tel'=>$questionsInfo->getTel(),
					'email'=>$questionsInfo->getEmail(),
					'questions'=>$questionsInfo->getQuestions(),
					'answers'=>$questionsInfo->getAnswers(),
					'date_created'=>$questionsInfo->getDateCreated(), 
					'file_upload'=>$questionsInfo->getFile_upload(),
					'status'=>$questionsInfo->getStatus(),
					'position'=>$questionsInfo->getPosition()
					);
		$questions->addData($fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "InfoText";
		
		$templateFile = "managelistquestions.temp.html";
		$act = 'list';
		$template->assign("act",$act);
		$pages = $questions->getNumItems('id',"1=1");
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		
		if($page > $pages) $page = $pages;	
		# Get all entries object and pass to template
		$questionsItems = $questions->getObjects($page,"1=1", array('position'=>'ASC'));
		$template->assign("listObjects",$questionsItems);	
		# Generate and pass link pager to template
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=questions&amp;act=list&amp;page=%s",$pages,$page);
		$template->assign("adminPager",$listPage);
		$template->assign('questions',$questions);
		$template->assign("rows",$rows);
		$template->assign("page",$page);
		$template->assign("pages",$pages);
		$template->assign("start",($page - 1) * $items_per_pages);
		$template->assign("searchTerms",$searchTerms);
		$template->assign("searchStatus",$searchStatus);
		$template->assign('subjects',$subjects);
	}else {
		$infoText = $amessages['item_inserted_error']."<br />".$validate;
		$infoClass = "errorText";	
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign('questions',$questions);
		$template->assign('status',$status);
		$template->assign('lang',$lang);
		$template->assign('sId',$sId);
		$template->assign('people',$people);		
		$template->assign('address',$address);
		$template->assign('tel',$tel);
		$template->assign('email',$email);
		$template->assign('question',$question);
		$template->assign('answers',$answers);
		$template->assign('file_upload',$file_upload);
		$template->assign('position',$position);
		$template->assign('slug',$addslug);
	}
}
$listStatus = optionStatus($request->element('searchStatus','-1'),DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);
$listLang = optionLang($searchLang);
$template->assign("listLang",$listLang);
$listSubject = $subjects->comboListObjects();
$template->assign("listSubject",$listSubject);


function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	#$infoText .= $validate->validStatus($amessages['language'],$request->element('addLang'));
	#$infoText .= $validate->validStatus($amessages['subject'],$request->element('sId'));
	$infoText .= $validate->validString($amessages['slug'],$request->element('slug'));
	#$infoText .= $validate->validString($amessages['title'],$request->element('title'));
	#$infoText .= $validate->validString($amessages['fname'],$request->element('people'));	
	#$infoText .= $validate->validEmail($amessages['email'],$request->element('email'));	
	$infoText .= $validate->validString($amessages['questions'],$request->element('question'));
	$infoText .= $validate->validString($amessages['answers'],$request->element('answers'));
	#$infoText .= $validate->validString($amessages['position'],$request->element('position',0));
	return $infoText;
}
?>