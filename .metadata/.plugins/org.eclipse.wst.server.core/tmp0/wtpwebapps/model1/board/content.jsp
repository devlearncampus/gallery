<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hexagon.galleryapp.pool.PoolManager"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%! PoolManager pool = PoolManager.getInstance();%>
<%
	// 게시판에 등록된 글 하나만 골라서 가져오기!!
	// select * from board where 
	
	//out, request, response 등 서블릿에서 개발자가 선언해야 하는 객체들은 jsp 에서는 이미 시스템 차원에서 생성되어 잇다..
	//이러한 중요한 필수 객체들을 가리켜 이미 준비되어 잇다고  built-int 오브젝트라 한다. == 내장 객체
	// request 내장객체는 서블릿의 doXXX 메서드로 전달되는 빨간 구슬인 HttpServletRequest 이다. 
	// response  내장객체는 파란구슬이다..
	int board_id= Integer.parseInt(request.getParameter("x")); //  "5" --> 5  wrapper Integer 클래스이용
	String sql="select * from board where board_id="+board_id;
	out.print(sql);
	
	//select문의 경우 JDBC  3총사 다 필요함!!!
	//아래의 객체들은 service() 메서드내에서의 사용이므로, 지역변수이다, 따라서 반드시 초기화 해야함 
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null; //단 한건이라 할지라도 표 이므로..
	
	con=pool.getConnection(); //풀로부터  Connection 한개 대여!!
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery(); // select 실행 및 그 결과를 표에 담기!!
	rs.next(); //한건이라 할지라도, 커서가 레코드를 가리키고 있지 않으므로, 한칸 내리자!!
%>
<!doctype html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>AdminLTE 4 | Form Elements</title>

    <!--begin::Theme Init (prevents flash of incorrect theme on load, #6043)-->
    <script>
      (() => {
        'use strict';
        const root = document.documentElement;

        // Applications with their own theming opt out of AdminLTE's color mode
        // entirely, here as well as in the bundle.
        if (root.getAttribute('data-lte-color-mode') === 'off') {
          return;
        }

        const STORAGE_KEY = 'lte-theme';
        let stored = null;
        try {
          stored = localStorage.getItem(STORAGE_KEY);
        } catch {
          // localStorage may be unavailable (private mode, sandboxed iframe).
        }
        // Mirror the precedence in color-mode.ts: the visitor's stored choice
        // wins, then a theme this page declared itself, then the OS preference.
        const authored = root.getAttribute('data-bs-theme');
        let resolved = 'light';
        if (stored === 'dark' || stored === 'light') {
          resolved = stored;
        } else if (authored === 'dark' || authored === 'light') {
          resolved = authored;
        } else if (globalThis.matchMedia('(prefers-color-scheme: dark)').matches) {
          resolved = 'dark';
        }
        root.setAttribute('data-bs-theme', resolved);
        root.style.colorScheme = resolved;
        // Flag values computed here, so the bundle does not mistake them for a
        // theme the page declared and stop following the OS preference.
        if (resolved !== authored) {
          root.setAttribute('data-lte-theme-resolved', '');
        }
      })();
    </script>
    <!--end::Theme Init-->

    <!--begin::Accessibility Meta Tags-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
    <meta name="color-scheme" content="light dark" />
    <meta name="theme-color" content="#007bff" media="(prefers-color-scheme: light)" />
    <meta name="theme-color" content="#1a1a1a" media="(prefers-color-scheme: dark)" />
    <!--end::Accessibility Meta Tags-->

    <!--begin::Primary Meta Tags-->
    <meta name="title" content="AdminLTE 4 | Form Elements" />
    <meta name="author" content="ColorlibHQ" />
    <meta
      name="description"
      content="AdminLTE is a free Bootstrap 5 admin dashboard template with almost 50 example pages, built with vanilla JS and designed with accessibility in mind."
    />
    <meta
      name="keywords"
      content="bootstrap 5, bootstrap, bootstrap 5 admin dashboard, bootstrap 5 dashboard, bootstrap 5 charts, bootstrap 5 calendar, bootstrap 5 datepicker, bootstrap 5 tables, bootstrap 5 datatable, vanilla js datatable, colorlibhq, colorlibhq dashboard, colorlibhq admin dashboard, accessible admin panel"
    />
    <!--end::Primary Meta Tags-->

    <!--begin::Accessibility Features-->
    <!-- Skip links will be dynamically added by accessibility.js -->
    <meta name="supported-color-schemes" content="light dark" />
    <link rel="preload" href="/dist/css/adminlte.css" as="style" />
    <!--end::Accessibility Features-->

    <!--begin::Fonts-->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css"
      integrity="sha256-tXJfXfp6Ewt1ilPzLDtQnJV4hclT9XuaZUKyUvmyr+Q="
      crossorigin="anonymous"
      media="print"
      onload="this.media = 'all'"
    />
    <!--end::Fonts-->

    <!--begin::Third Party Plugin(OverlayScrollbars)-->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.11.0/styles/overlayscrollbars.min.css"
      crossorigin="anonymous"
    />
    <!--end::Third Party Plugin(OverlayScrollbars)-->

    <!--begin::Third Party Plugin(Bootstrap Icons)-->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css"
      crossorigin="anonymous"
    />
    <!--end::Third Party Plugin(Bootstrap Icons)-->

    <!--begin::Required Plugin(AdminLTE)-->
    <link rel="stylesheet" href="/dist/css/adminlte.css" />
    <!--end::Required Plugin(AdminLTE)-->
  </head>
  <body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
    <div class="app-wrapper">
      <!--begin::Header-->
	  <%@ include file="../inc/header.jsp"%>
      <!--end::Header-->
      
      <!--begin::Sidebar-->
      <%@ include file="../inc/sidebar.jsp" %>
      <!--end::Sidebar-->
      <main class="app-main">
        <div class="app-content-header">
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-6">
                <h1 class="mb-0 fs-3">Form Elements</h1>
              </div>
              <div class="col-sm-6">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb float-sm-end">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Elements</li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
        </div>
        <div class="app-content">
          <div class="container-fluid">
            <div class="row g-4">
              <div class="col-12">
                <div class="callout callout-info">
                  For detailed documentation visit
                  <a
                    href="https://getbootstrap.com/docs/5.3/forms/overview/"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="callout-link"
                    >Bootstrap Forms</a
                  >.
                </div>
              </div>

              <!-- Quick Example -->
              <div class="col-md-12">
                <div class="card card-primary card-outline mb-4">
                  <div class="card-header">
                    <div class="card-title">게시판</div>
                  </div>
                  <form id="form1">
                  		<!-- 일반 유저를 위한 것이 아니라, 개발자의 필요에 의한 파라미터 전송 시 사용할 수 있는 태그인 hidden -->
                  		<input type="hidden" name="board_id" value="<%=board_id%>" style="background:yellow">
                  		
                    <div class="card-body">
                      
                      <div class="mb-3">
                        <input type="text" class="form-control" value="<%=rs.getString("title")%>" name="title"/>
                      </div>
                      
                      <div class="mb-3">
                        <input type="text" class="form-control" value="<%=rs.getString("writer")%>" name="writer"/>
                      </div>
                      
                      <div class="mb-3">
                        <textarea type="text" id="editor" class="form-control" name="content"><%=rs.getString("content") %></textarea>
                      </div>
                    </div>
                    <div class="card-footer">
                      <button type="button" class="btn btn-default" id="bt_update">글수정</button>
                      <button type="button" class="btn btn-default" id="bt_list">글목록</button>
                      <button type="button" class="btn btn-default" id="bt_del">삭제</button>
                    </div>
                  </form>
                </div>
              </div>

            
            </div>
          </div>
        </div>
      </main>
      <!--begin::Footer-->
		<%@ include file="../inc/footer.jsp" %>
      <!--end::Footer-->
    </div>
    <!--begin::Third Party Plugin(OverlayScrollbars)-->
    <script
      src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.11.0/browser/overlayscrollbars.browser.es6.min.js"
      crossorigin="anonymous"
    ></script>
    <!--end::Third Party Plugin(OverlayScrollbars)--><!--begin::Required Plugin(popperjs for Bootstrap 5)-->
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
      crossorigin="anonymous"
    ></script>
    <!--end::Required Plugin(popperjs for Bootstrap 5)--><!--begin::Required Plugin(Bootstrap 5)-->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js"
      crossorigin="anonymous"
    ></script>
    <!--end::Required Plugin(Bootstrap 5)--><!--begin::Required Plugin(AdminLTE)-->
    <script src="/dist/js/adminlte.js"></script>
    <!--end::Required Plugin(AdminLTE)-->
    <!--begin::OverlayScrollbars Configure-->
    <script>
      const SELECTOR_SIDEBAR_WRAPPER = '.sidebar-wrapper';
      const Default = {
        scrollbarTheme: 'os-theme-light',
        scrollbarAutoHide: 'leave',
        scrollbarClickScroll: true,
      };
      document.addEventListener('DOMContentLoaded', function () {
        const sidebarWrapper = document.querySelector(SELECTOR_SIDEBAR_WRAPPER);

        // Disable OverlayScrollbars on mobile devices to prevent touch interference
        const isMobile = window.innerWidth <= 992;

        if (
          sidebarWrapper &&
          OverlayScrollbarsGlobal?.OverlayScrollbars !== undefined &&
          !isMobile
        ) {
          OverlayScrollbarsGlobal.OverlayScrollbars(sidebarWrapper, {
            scrollbars: {
              theme: Default.scrollbarTheme,
              autoHide: Default.scrollbarAutoHide,
              clickScroll: Default.scrollbarClickScroll,
            },
          });
        }
      });
    </script>
    <!--end::OverlayScrollbars Configure-->
    <!--begin::Charts follow the colour mode-->
    <script>
      // ApexCharts draws light-theme tooltips and axis text unless told otherwise,
      // which is unreadable in dark mode (#6105). Give it the page's colour mode as
      // a global default before any chart is created â this runs before the chart
      // pages' own scripts â and keep every chart that has a `chart.id` in step
      // when the mode changes (ColorMode, the OS in auto mode, or your own code).
      (() => {
        'use strict';
        const mode = () =>
          document.documentElement.getAttribute('data-bs-theme') === 'dark' ? 'dark' : 'light';
        // `Apex` is ApexCharts' global-options object; it must exist before the library loads.
        // theme.mode also sets a dark chart background â keep the card's instead.
        // eslint-disable-next-line unicorn/no-global-object-property-assignment
        globalThis.Apex ||= {};
        const apex = globalThis.Apex;
        apex.theme = { mode: mode() };
        apex.chart = Object.assign(apex.chart || {}, { background: 'transparent' });
        new MutationObserver(() => {
          const next = mode();
          apex.theme = { mode: next };
          const instances = apex._chartInstances || [];
          for (const { chart } of instances) {
            chart.updateOptions({ theme: { mode: next } }, false, false);
          }
        }).observe(document.documentElement, {
          attributes: true,
          attributeFilter: ['data-bs-theme'],
        });
      })();
    </script>
    <!--end::Charts follow the colour mode-->

    <!--begin::Color Mode Toggle-->
    <!-- The light/dark/auto switcher ships in adminlte.js as the ColorMode
     module (since 4.1) â no page script needed. Only the no-flash snippet
     in <head> stays inline, because it must run before first paint. -->
    <!--end::Color Mode Toggle-->
	 
	<!-- summernote 관련 링크 begin -->   
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>    
  	<!-- summernote 관련 링크 end -->
  	<script type="text/javascript">
  	
  	
	  	$(function(){
	  		
	  		//(누구를-선택자).어떻게()
			$("#editor").summernote({
				placeholder:"내용을 입력하세요",
				height:250
			});
	  		
	  		//글쓰기 버튼에 대한 이벤트 연결을 jquery로 진행해보자
	  		$("#bt_regist").click(function(){
				//서버에 전송하자!!	  	
				//Jquery는 내부적으로 DOM을 접근할 수 있다..간단한 코드로 제어가능..
				$("#form1").attr("action", "/board/regist"); // <form action="/board/regist"> 와 동일
				$("#form1").attr("method", "POST"); // <form method="POST"> 와 동일
				$("#form1").submit(); //전송 메서드!! 이 시점에 비로소 전송이 일어남!!				
	  		});
	  		
	  		// 글목록 페이지 요청 
	  		$("#bt_list").click(function(){
	  			$(location).attr("href", "/board/list.jsp");	
	  		});
	  		
	  		//글 삭제 요청 
	  		$("#bt_del").click(function(){
				//글  삭제 시 요청 방법을 ? GET/POST
				//js에서 링크는 location 내장 객체의 속성인 href를 이용 
				//let ans = confirm("삭제하시겠어요?");
				if(confirm("삭제하시겠어요?")){ //ans가 true 이면..
					location.href="/board/delete?board_id=<%=board_id%>"; // <a></a>와 같은 효과...
				}
	  		});
	  		
	  		//글 수정 요청 
	  		$("#bt_update").click(function(){
				if(confirm("수정된 내용을 반영하시겠어요?")){
					//$("#form1").attr("action", "/board/update");
					//$("#form1").attr("method", "POST");
					
					//form의 속성이 여러개 이상인 즉 복합적인 데이터 유형이므로, 이때는 js의 객체리터럴로 표현하면 좋다
					$("#form1").attr({
						action:"/board/update",
						method:"POST"
					});
					$("#form1").submit(); // 여기서 전송이 발생!!
				}
	  		});
	  		
	  	});  	
  	</script>
	  	
  </body>
</html>
<%
	pool.release(con, pstmt, rs);
%>



















