<h2 id="article_category">{writeRubrik}</h2>
<div id="solution_id">ID #{solution_id}</div>
<h2>{writeThema}</h2>

    <!-- Article -->
    <div id="article_content">{writeContent}</div>
    <!-- /Article -->

    <!-- Article Categories Listing -->
    {writeArticleCategories}
    <!-- /Article Categories Listing -->

    <!-- Tags -->
    <p><strong>{writeTagHeader}</strong> {writeArticleTags}</p>
    <!-- /Tags -->

    <!-- Related Articles -->
    <div id="article_related"><strong>{writeRelatedArticlesHeader}</strong>{writeRelatedArticles}</div>
    <!-- / Related Articles -->

    <!-- Article Info -->
    <p><span id="popularity" style="display: none;">{writePopularity}</span>{writeDateMsg}<br />{writeAuthor}<br />{writeRevision}<br />{editThisEntry}</p>
    <!-- /Article Info -->

    {switchLanguage}
    <p id="action">
    <img src="images/digg.gif" alt="{writeDiggMsgTag}" title="{writeDiggMsgTag}" width="24" height="16" border="0" /> {writeDiggMsg}<br />
    <img src="images/print.gif" alt="{writePrintMsgTag}" title="{writePrintMsgTag}" width="16" height="16" border="0" /> {writePrintMsg}<br />
    <img src="images/email.gif" alt="{writeSend2FriendMsgTag}" title="{writeSend2FriendMsgTag}" width="16" height="16" border="0" /> {writeSend2FriendMsg}<br />
    <img src="images/pdf.gif" alt="{writePDFTag}" title="{writePDFTag}" width="16" height="16" border="0" /> {writePDF}
    </p>

    <!-- Voting Form -->
    <form action="{saveVotingPATH}" method="post" style="display: inline;">
    <fieldset>
    <legend>{msgVoteUseability}</legend>
    <input type="hidden" name="artikel" value="{saveVotingID}" />
    <input type="hidden" name="userip" value="{saveVotingIP}" />
    <p align="center"><strong>{msgAverageVote}</strong> {printVotings}</p>
    <p align="center">{msgVoteBad}
    <input class="radio" type="radio" name="vote" value="1" /> 1
    <input class="radio" type="radio" name="vote" value="2" /> 2
    <input class="radio" type="radio" name="vote" value="3" /> 3
    <input class="radio" type="radio" name="vote" value="4" /> 4
    <input class="radio" type="radio" name="vote" value="5" /> 5
    {msgVoteGood}<br />
    <input class="submit" type="submit" name="submit" value="{msgVoteSubmit}" />
    </p>
    </fieldset>
    </form>
    <!-- /Voting Form -->

    <p>{writeCommentMsg}</p>

    <!-- Comment Form -->
    <a name="comment"></a><div id="comment" style="display: none;">
    <form action="{writeSendAdress}" method="post">
    <input type="hidden" name="id" value="{id}" />
    <input type="hidden" name="lang" value="{lang}" />
    <input type="hidden" name="type" value="faq" />

    <fieldset>
    <legend>{msgWriteComment}</legend>

        <label for="user" class="left">{msgNewContentName}</label>
        <input class="inputfield" type="text" id="user" name="user" value="{defaultContentName}" size="50" /><br />

        <label for="mail" class="left">{msgNewContentMail}</label>
        <input class="inputfield" type="text" id="mail" name="mail" value="{defaultContentMail}" size="50" /><br />

        <label for="comment_text" class="left">{msgYourComment}</label>
        <textarea class="inputarea" cols="37" rows="10" id="comment_text" name="comment"></textarea><br />

    </fieldset>

    {captchaFieldset}

    <div style="text-align:center;">
        <input class="submit" type="submit" name="submit" value="{msgNewContentSubmit}" />
    </div>
    <br />

    </form>
    </div>
    <!-- /Comment Form -->

    {writeComments}

