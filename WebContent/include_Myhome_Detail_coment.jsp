<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.Posting_replyDTO"%>
<%@ page import="com.jachi.DTO.PageInfo"%>

<%
	ArrayList<Posting_replyDTO> coment = (ArrayList<Posting_replyDTO>) request.getAttribute("coment");
	String post_num = (String) request.getParameter("post_num");

	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>
<div class="card-detail-comment-section">
	<section class="comment-feed">
		<h1 class="comment-feed__header">
			댓글&nbsp;<span class="comment-feed__header__count">267</span>
		</h1>
		<form class="comment-feed__form" action="myPage_reply_insert.bo">
			<input type="hidden" value="<%=post_num%>" name="post_num">
			<div class="comment-feed__form__user">
				<img
					src="https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&amp;w=36&amp;webp=1"
					srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&amp;w=72&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&amp;w=72&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&amp;w=144&amp;webp=1 3x">
			</div>
			<div class="comment-feed__form__input">
				<div class="comment-feed__form__content">

					<input type="text"
						class="comment-content-input__text comment-feed__form__content__text"
						name="post_coment">

				</div>
				<div class="comment-feed__form__actions">
					<button class="comment-feed__form__submit" aria-label="등록"
						type="submit">등록</button>
				</div>
			</div>
		</form>
		<ul class="comment-feed__list">


			<%
				if (coment.size() != 0) {
					for (int i = 0; i < coment.size(); i++) {
			%>
			<li class="comment-feed__list__item"><article
					class="comment-feed__item">
					<p class="comment-feed__item__content">
						<a href="/users/6600494"
							class="comment-feed__item__content__author"><img
							class="comment-feed__item__content__author__image" alt="오세두"
							src="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images1581002795_917854.jpeg?gif=1&amp;w=36&amp;webp=1"
							srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images1581002795_917854.jpeg?gif=1&amp;w=72&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images1581002795_917854.jpeg?gif=1&amp;w=72&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images1581002795_917854.jpeg?gif=1&amp;w=144&amp;webp=1 3x"><span
							class="comment-feed__item__content__author__name"><%=coment.get(i).getPosting_reply_us_id()%></span></a><span
							class="comment-feed__item__content__content"><%=coment.get(i).getPosting_reply_text()%></span>
					</p>
				</article></li>

			<%
				}
				}
			%>


		</ul>
		<%
		if (coment.size() != 0) {
		%>
		<ul class="list-paginator">
			<%
				for (int a = startPage; a <= endPage; a++) {
					if (a == nowPage) {
			%>
			<li><button class="list-paginator__page sm selected"
					type="button"
					onclick="location.href='Beautyroom_Detail.bo?board_num=<%=coment.get(0).getPosting_reply_post_num()%>&page=<%=a%>'"><%=a%></button></li>
			<%
				} else {
			%>
			<li><button class="list-paginator__page sm selected"
					type="button"
					onclick="location.href='Beautyroom_Detail.bo?board_num=<%=coment.get(0).getPosting_reply_post_num()%>&page=<%=a%>'"><%=a%></button></li>
			<%
				}
				}
			%>

			<%
				if (nowPage >= maxPage) {
			%>

			<li><button class="list-paginator__next" type="button"
					onclick="location.href='Beautyroom_Detail.bo?board_num=<%=coment.get(0).getPosting_reply_post_num()%>&page=<%=nowPage + 1%>'">
					<svg width="26" height="26" viewBox="0 0 26 26"
						preserveAspectRatio="xMidYMid meet">
												<g fill="none" fill-rule="evenodd"
							transform="matrix(-1 0 0 1 26 0)">
												<rect width="25" height="25" x=".5" y=".5" stroke="#DCDCDC"
							rx="4"></rect>
												<g stroke="#424242" stroke-linecap="square" stroke-width="2">
												<path d="M14.75 8.263L10.25 13M10.25 13l4.5 4.737"></path></g></g></svg>
				</button></li>
			<%
				} else {
			%>
			<li><button class="list-paginator__next" type="button"
					onclick="location.href='Beautyroom_Detail.bo?board_num=<%=coment.get(0).getPosting_reply_post_num()%>&page=<%=nowPage + 1%>'">
					<svg width="26" height="26" viewBox="0 0 26 26"
						preserveAspectRatio="xMidYMid meet">
												<g fill="none" fill-rule="evenodd"
							transform="matrix(-1 0 0 1 26 0)">
												<rect width="25" height="25" x=".5" y=".5" stroke="#DCDCDC"
							rx="4"></rect>
												<g stroke="#424242" stroke-linecap="square" stroke-width="2">
												<path d="M14.75 8.263L10.25 13M10.25 13l4.5 4.737"></path></g></g></svg>
				</button></li>
			<%
				}
		}
			%>
		</ul>
	</section>
</div>
