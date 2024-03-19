<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseInstructor.aspx.cs" Inherits="ClassroomCoursework.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="d-flex flex-column w-100">
 <div class=" mt-2 px-3 d-flex justify-content-between align-items-center">
     <h2 class=" text-primary fs-4">View Details of Course and their Instructors.</h2>
     <div class=" d-flex gap-2 align-items-center w-50 justify-content-end">
           <h2 class=" fs-5 fw-semibold">Select a Course: </h2>
         <asp:DropDownList ID="DropDownList1" AutoPostBack="True" CssClass=" w-100 px-2 py-2 fs-6 border border-2 rounded-2" runat="server" DataSourceID="Courses" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID"></asp:DropDownList>
         <asp:SqlDataSource runat="server" ID="Courses" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "COURSE_ID", "COURSE_TITLE" FROM "COURSE"'></asp:SqlDataSource>
     </div>       
 </div>
     <div class=" d-flex flex-column px-3 w-100">
        
     </div>
  <div class="w-100 mt-4">
      <h3 class="fs-5 fw-semibold">Selected Course Details</h3>
      <asp:DataList ID="DataList1" runat="server" DataKeyField="COURSE_ID" DataSourceID="CourseDetails">
          <ItemTemplate>
              <div class="bg-light py-2 w-100 px-4 gap-4">
                  <strong class=" fw-normal">COURSE ID:</strong>
                  <asp:Label Text='<%# Eval("COURSE_ID") %>' runat="server" ID="COURSE_IDLabel" /><br />
                  <strong class="fw-normal">COURSE TITLE:</strong>
                  <asp:Label Text='<%# Eval("COURSE_TITLE") %>' runat="server" ID="COURSE_TITLELabel" /><br />
                  <strong class="fw-normal">DURATION:</strong>
                  <asp:Label Text='<%# Eval("DURATION") %>' runat="server" ID="DURATIONLabel" /><br />
                  <strong class="fw-normal">PRICE:</strong>
                  <span>$</span>
                  <asp:Label Text='<%# Eval("PRICE") %>' runat="server" ID="PRICELabel" />
                  <br />
              </div>
          </ItemTemplate>
      </asp:DataList>
      <asp:SqlDataSource runat="server" ID="CourseDetails" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="SELECT COURSE_ID, COURSE_TITLE, RELASE_DATE, DURATION, PRICE FROM COURSE WHERE (COURSE_ID = :course)">
          <SelectParameters>
              <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="course"></asp:ControlParameter>
          </SelectParameters>
      </asp:SqlDataSource>
      <h1 class=" text-primary mt-4 px-4 fs-5">Instructor Details</h1>
      <asp:GridView ID="GridView1" CssClass="w-100 mt-3" AlternatingRowStyle-BackColor="#FAFAFA" RowStyle-CssClass=" border-bottom" HeaderStyle-Font-Size="Larger" HeaderStyle-BackColor="#1b6ee2" HeaderStyle-ForeColor="White" BorderStyle="Groove" CellPadding="7" GridLines="Horizontal" PagerStyle-BorderWidth="4" runat="server" AutoGenerateColumns="False" DataKeyNames="INSTRUCTOR_ID" DataSourceID="INstructorDetails">
          <Columns>
              <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="Instructor Id" ReadOnly="True" SortExpression="INSTRUCTOR_ID"></asp:BoundField>
              <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="Instructor Name" SortExpression="INSTRUCTOR_NAME"></asp:BoundField>
              <asp:BoundField DataField="COURSE_ID" HeaderText="Course Id" SortExpression="COURSE_ID"></asp:BoundField>
              <asp:BoundField DataField="INSTRUCTOR_EMAIL" HeaderText="Instructor Email" SortExpression="INSTRUCTOR_EMAIL"></asp:BoundField>
              <asp:BoundField DataField="PASSWORD" HeaderText="Password" SortExpression="PASSWORD"></asp:BoundField>
              <asp:BoundField DataField="JOINED_DATE" HeaderText="Joined Date" SortExpression="JOINED_DATE"></asp:BoundField>
              <asp:BoundField DataField="PROFILE" HeaderText="Profile" SortExpression="PROFILE"></asp:BoundField>
          </Columns>
      </asp:GridView>

      <asp:SqlDataSource runat="server" ID="INstructorDetails" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT INSTRUCTOR_ID, INSTRUCTOR_NAME, COURSE_ID, INSTRUCTOR_EMAIL, "PASSWORD", "PROFILE", JOINED_DATE FROM INSTRUCTOR WHERE (COURSE_ID = :course)'>
          <SelectParameters>
              <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="course"></asp:ControlParameter>
          </SelectParameters>
      </asp:SqlDataSource>
  </div>
   
 </div>
</asp:Content>
