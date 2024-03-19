<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BestCourse.aspx.cs" Inherits="ClassroomCoursework.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
     <div class="d-flex flex-column w-100">
 <div class=" mt-2 px-3 d-flex justify-content-between align-items-center">
     <h2 class=" text-primary fs-4">Top 3 Best E-Learning Course</h2>
     <div class=" d-flex gap-2 align-items-center w-50 justify-content-end">
           <h2 class=" fs-5 fw-semibold">Select Year and Month: </h2>
         <asp:DropDownList ID="yearss" runat="server"  CssClass=" rounded-1 px-2 py-2 border border-2" AutoPostBack="True" Width="99px" DataSourceID="Year" DataTextField="YEAR" DataValueField="YEAR"></asp:DropDownList>
         <asp:SqlDataSource runat="server" ID="Year" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="SELECT DISTINCT TO_CHAR(ENROLLED_DATE, 'YYYY') AS year FROM ENROLMENT"></asp:SqlDataSource>
         <asp:DropDownList ID="month" runat="server"  CssClass=" rounded-1 px-2 py-2 border border-2" AutoPostBack="true" Width="120px" DataSourceID="YearList" DataTextField="NAME" DataValueField="MONTH_NUMBER"></asp:DropDownList>
         <asp:SqlDataSource runat="server" ID="YearList" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="SELECT DISTINCT TO_CHAR(ENROLLED_DATE, 'MM') AS month_number, TO_CHAR(ENROLLED_DATE, 'Month') AS name FROM ENROLMENT ORDER BY month_number"></asp:SqlDataSource>
     </div>       
 </div>
  <div class="w-100 mt-4">
      <h3 class="fs-6 fw-semibold">Course Details</h3>
      <asp:GridView ID="GridView1" CssClass="w-100 mt-3" AlternatingRowStyle-BackColor="#FAFAFA" RowStyle-CssClass=" border-bottom" HeaderStyle-Font-Size="Larger" HeaderStyle-BackColor="#1b6ee2" HeaderStyle-ForeColor="White" BorderStyle="Groove" CellPadding="7" GridLines="Horizontal" PagerStyle-BorderWidth="4" runat="server" HeaderStyle-CssClass=" text-decoration-none bg-primary" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
          <Columns>
              <asp:BoundField DataField="COURSE_ID" HeaderText="Course Id" SortExpression="COURSE_ID"></asp:BoundField>
              <asp:BoundField DataField="COURSE_TITLE" HeaderText="Course Title" SortExpression="COURSE_TITLE"></asp:BoundField>
              <asp:BoundField DataField="RELASE_DATE" HeaderText="Release Date" SortExpression="RELASE_DATE"></asp:BoundField>
              <asp:BoundField DataField="DURATION" HeaderText="Duration" SortExpression="DURATION"></asp:BoundField>
              <asp:BoundField DataField="COUNTS" HeaderText="Enroll Count" SortExpression="COUNTS"></asp:BoundField>
          </Columns>
      </asp:GridView>
      <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="SELECT * from (SELECT e.COURSE_ID, c.COURSE_TITLE, c.RELASE_DATE, c.DURATION, COUNT(*) AS COUNTS FROM ENROLMENT e, COURSE c WHERE e.COURSE_ID = c.COURSE_ID AND (TO_CHAR(e.ENROLLED_DATE, 'MM') = :month) AND (TO_CHAR(e.ENROLLED_DATE, 'YYYY') = :year) GROUP BY e.COURSE_ID, c.COURSE_TITLE, c.RELASE_DATE, c.DURATION ORDER BY COUNTS DESC) where rownum<=3">
          <SelectParameters>
              <asp:ControlParameter ControlID="month" PropertyName="SelectedValue" DefaultValue="03" Name="month"></asp:ControlParameter>
              <asp:ControlParameter ControlID="yearss" PropertyName="SelectedValue" DefaultValue="2024" Name="year"></asp:ControlParameter>
          </SelectParameters>
      </asp:SqlDataSource>
  </div>
   
 </div>
</asp:Content>
