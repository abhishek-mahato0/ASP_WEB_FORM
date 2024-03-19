<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ClassroomCoursework._Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <div class=" w-100 px-3 d-flex align-items-center justify-content-start gap-3">
       <h1 class=" text-primary fs-3">Dashboard</h1>
   </div>
    <div class=" d-flex w-100 align-items-center justify-content-between">
        <div class="p-2 rounded" style="width: 250px;">
            <div class="d-flex w-100 px-4 py-2 rounded-3 flex-column align-items-start shadow justify-content-start" style="background-color: #E3F2FF; color: #0388F8;">
                <h5 class=" text-black fw-bold">Courses</h5>
                <div class="d-flex w-100 justify-content-between align-items-center">
                    <asp:BulletedList ID="BulletedList1" runat="server" DataSourceID="Courses" DataTextField="TOTAL_COURSES" DataValueField="TOTAL_COURSES" CssClass=" fs-1 fw-bolder list-unstyled"></asp:BulletedList>
                    <asp:SqlDataSource runat="server" ID="Courses" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="SELECT COUNT(*) AS total_courses FROM COURSE"></asp:SqlDataSource>
                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-journal-richtext" viewBox="0 0 16 16">
                        <path d="M7.5 3.75a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0m-.861 1.542 1.33.886 1.854-1.855a.25.25 0 0 1 .289-.047L11 4.75V7a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 7v-.5s1.54-1.274 1.639-1.208M5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5" />
                        <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2" />
                        <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z" />
                    </svg>
                </div>
            </div>
        </div>
       
        <div class="p-2 rounded" style="width: 250px;">
            <div class="d-flex w-100 px-4 py-2 rounded-3 flex-column align-items-start shadow justify-content-start" style="background-color: #E3F2FF; color: #0388F8;">

                <h5 class=" text-black fw-bold">Instructors</h5>
                <div class="d-flex w-100 justify-content-between align-items-center">
                    <asp:BulletedList ID="BulletedList2" runat="server" DataSourceID="Students" DataTextField="COUNT" DataValueField="COUNT" CssClass=" fs-1 fw-bolder list-unstyled"></asp:BulletedList>
                    <asp:SqlDataSource runat="server" ID="Students" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="SELECT COUNT(*) AS count FROM INSTRUCTOR"></asp:SqlDataSource>

                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-rolodex" viewBox="0 0 16 16">
                        <path d="M8 9.05a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5" />
                        <path d="M1 1a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h.5a.5.5 0 0 0 .5-.5.5.5 0 0 1 1 0 .5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5.5.5 0 0 1 1 0 .5.5 0 0 0 .5.5h.5a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H6.707L6 1.293A1 1 0 0 0 5.293 1zm0 1h4.293L6 2.707A1 1 0 0 0 6.707 3H15v10h-.085a1.5 1.5 0 0 0-2.4-.63C11.885 11.223 10.554 10 8 10c-2.555 0-3.886 1.224-4.514 2.37a1.5 1.5 0 0 0-2.4.63H1z" />
                    </svg>
                </div>
            </div>
        </div>

        <div class="p-2 rounded" style="width: 250px;">
            <div class="d-flex w-100 px-4 py-2 rounded-3 flex-column align-items-start shadow justify-content-start" style="background-color: #E3F2FF; color: #0388F8;">

                <h5 class=" text-black fw-bold">Students</h5>
                <div class="d-flex w-100 justify-content-between align-items-center">
                    <asp:BulletedList ID="BulletedList3" runat="server" DataSourceID="Inst" DataTextField="STU_COUNT" DataValueField="STU_COUNT" CssClass=" fs-1 fw-bolder list-unstyled"></asp:BulletedList>
                    <asp:SqlDataSource runat="server" ID="Inst" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="SELECT COUNT(*) AS stu_count FROM STUDENT"></asp:SqlDataSource>
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
                        <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5" />
                    </svg>

                </div>
            </div>
        </div>

        <div class="p-2 rounded" style="width: 420px;">
            <div class="d-flex w-100 px-4 py-2 rounded-3 flex-column align-items-start shadow justify-content-start" style="background-color: #E3F2FF; color: #0388F8;">
                <div class="d-flex w-100 justify-content-between align-items-center">
                    <h5 class=" text-black fw-bold">Top Enrolled Course & Count</h5>
                    <asp:SqlDataSource runat="server" ID="TopTitle" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="SELECT * FROM (SELECT c.COURSE_TITLE, COUNT(*) AS COUNTS FROM ENROLMENT e, COURSE c WHERE e.COURSE_ID = c.COURSE_ID GROUP BY e.COURSE_ID, c.COURSE_TITLE ORDER BY COUNTS DESC) where rownum<=1"></asp:SqlDataSource>
                    <asp:SqlDataSource runat="server" ID="TopCourse" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="SELECT * from (SELECT c.COURSE_TITLE, COUNT(*) AS COUNTS FROM ENROLMENT e, COURSE c WHERE e.COURSE_ID = c.COURSE_ID GROUP BY e.COURSE_ID, c.COURSE_TITLE ORDER BY COUNTS DESC) where rownum<=1"></asp:SqlDataSource>
                </div>
                <div class="d-flex w-100 justify-content-between align-items-center">
                    <asp:BulletedList ID="BulletedList4" runat="server" DataSourceID="TopCourse" DataTextField="COUNTS" DataValueField="COUNTS" CssClass=" fs-1 fw-bolder list-unstyled"></asp:BulletedList>
                    <asp:BulletedList ID="BulletedList5" runat="server" DataSourceID="TopTitle" DataTextField="COURSE_TITLE" DataValueField="COURSE_TITLE" CssClass=" fs-5 list-unstyled" ForeColor="#FF9525"></asp:BulletedList>

                </div>
            </div>
        </div>
        </div>

    <div class=" d-flex w-100 px-2 mt-4 flex-column gap-3">
        <h2 class=" text-primary">Insights</h2>
      <div class=" d-flex w-100 align-items-start justify-content-center gap-4 mt-2">
        <div class="d-flex flex-column px-3 py-3 rounded-3" style=" width:750px; background-color:#FAFAFA">
            <h5>Top 5 Most Enrolled Courses</h5>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="Enrolments" BackColor="#FAFAFA" Width="590px" Height="400px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="COURSE_TITLE" YValueMembers="COUNTS"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        <asp:SqlDataSource runat="server" ID="Enrolments" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="Select * from (SELECT c.COURSE_TITLE, COUNT(*) AS counts FROM ENROLMENT e, COURSE c WHERE c.COURSE_ID = e.COURSE_ID GROUP BY c.COURSE_TITLE ORDER BY COUNT(*) DESC) where rownum<=5"></asp:SqlDataSource>
        </div>
          <div class="w-50 d-flex flex-column px-3 py-3 rounded-3" style="background-color: #FAFAFA">
              <h5>Most Active Students and enrolled courses count</h5>
              <asp:GridView ID="GridView1" CssClass=" w-100 table" RowStyle-CssClass=" text-bg-light p-4" HeaderStyle-CssClass=" bg-primary p-2" HeaderStyle-ForeColor="White" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="Active">
                  <Columns>
                      <asp:BoundField DataField="STUDENT_NAME" HeaderText="Active Students Name" SortExpression="STUDENT_NAME"></asp:BoundField>
                      <asp:BoundField HeaderText="Enrolled Course Count" DataField="ENROLLED_COURSES_COUNT" SortExpression="ENROLLED_COURSES_COUNT"></asp:BoundField>
                  </Columns>
              </asp:GridView>

              <asp:SqlDataSource runat="server" ID="Active" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="Select * from (SELECT s.STUDENT_ID, s.STUDENT_NAME, COUNT(e.COURSE_ID) AS enrolled_courses_count FROM STUDENT s, ENROLMENT e WHERE s.STUDENT_ID = e.STUDENT_ID GROUP BY s.STUDENT_ID, s.STUDENT_NAME ORDER BY enrolled_courses_count DESC) where rownum<=8"></asp:SqlDataSource>
          </div>
         
        </div>

        <%--Second charts row--%>
        <div class=" d-flex w-100 align-items-center justify-content-center gap-4 mt-2">
            <div class="w-50 d-flex flex-column px-3 py-3 rounded-3" style="background-color: #FAFAFA">
                <h5>Top 5 Most Expensive Courses</h5>
                <asp:Chart ID="Chart3" runat="server" DataSourceID="Expensive"  Width="550px" Height="400px">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="COURSE_TITLE" YValueMembers="PRICE"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource runat="server" ID="Expensive" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="Select * from (SELECT COURSE_TITLE, PRICE FROM COURSE ORDER BY PRICE DESC) where rownum<=5"></asp:SqlDataSource>
            </div>
            <div class="w-50 d-flex flex-column px-3 py-3 rounded-3" style="background-color: #FAFAFA">
                <h5>Course Progress Ratio</h5>
                <asp:Chart ID="Chart4" runat="server" BackColor="250, 250, 250" DataSourceID="Progress" Width="550px" Height="400px">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="LESSON_STATUS" YValueType="Double" IsValueShownAsLabel="true" IsXValueIndexed="true" YValueMembers="STATUS_COUNT" ChartType="Doughnut">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Name="Legend1" Docking="Bottom"></asp:Legend>
                    </Legends>
                </asp:Chart>
                <asp:SqlDataSource runat="server" ID="Progress" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="SELECT UPPER(LESSON_STATUS) AS lesson_status, COUNT(*) AS status_count FROM PROGRESS GROUP BY UPPER(LESSON_STATUS)"></asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="Select * from (SELECT c.COURSE_TITLE, COUNT(*) AS counts FROM INSTRUCTOR i, COURSE c WHERE i.COURSE_ID = c.COURSE_ID GROUP BY c.COURSE_TITLE ORDER BY counts DESC) where rownum<=5"></asp:SqlDataSource>
            </div>
        </div>

        <%--third--%>
          <div class=" d-flex w-100 align-items-center justify-content-start gap-4 mt-2">
     
              <div class="w-50 d-flex flex-column px-3 py-3 rounded-3" style="background-color: #FAFAFA">
                  <h5>Top 5 Courses with most Instructors</h5>
                  <asp:Chart ID="Chart2" runat="server" BackColor="#FAFAFA" DataSourceID="InstructorsCount" Width="550px" Height="400px">
                      <Series>
                          <asp:Series Name="Series1" XValueMember="COURSE_TITLE" YValueMembers="COUNTS"></asp:Series>
                      </Series>
                      <ChartAreas>
                          <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                      </ChartAreas>
                  </asp:Chart>
                  <asp:SqlDataSource runat="server" ID="InstructorsCount" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="Select * from (SELECT c.COURSE_TITLE, COUNT(*) AS counts FROM INSTRUCTOR i, COURSE c WHERE i.COURSE_ID = c.COURSE_ID GROUP BY c.COURSE_TITLE ORDER BY counts DESC) where rownum<=5"></asp:SqlDataSource>
              </div>
         </div>

    </div>

</asp:Content>
