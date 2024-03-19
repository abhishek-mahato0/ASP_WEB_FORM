<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentDetail.aspx.cs" Inherits="ClassroomCoursework.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex flex-column w-100">
    <div class=" mt-2 px-3 d-flex justify-content-between align-items-center">
        <h2 class=" text-primary fs-4">View Details of Students and their enrolled courses.</h2>
        <div class=" d-flex gap-2 align-items-center justify-content-end w-50">
            <h2 class=" fs-5 fw-semibold">Select a student: </h2>
            <asp:DropDownList ID="DropDownList1" CssClass=" w-100 rounded-1 px-2 py-2 border border-2" runat="server" AutoPostBack="True" DataSourceID="Students" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="Students" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "STUDENT_ID", "STUDENT_NAME" FROM "STUDENT"'></asp:SqlDataSource>
             </div>       
    </div>
        <div class=" d-flex flex-column px-3 w-100">
            <asp:DataList ID="DataList1" CssClass="w-50"  runat="server" DataKeyField="STUDENT_ID" DataSourceID="FIltered">
                <ItemTemplate>
                    <p class=" fw-semibold">Selected students detail</p>
                    <div class="bg-light px-2">
                        Student Id:
                    <asp:Label Text='<%# Eval("STUDENT_ID") %>' runat="server" ID="STUDENT_IDLabel" /><br />
                        Student Name:
                    <asp:Label Text='<%# Eval("STUDENT_NAME") %>' runat="server" ID="STUDENT_NAMELabel" /><br />
                        Student Email:
                    <asp:Label Text='<%# Eval("STUDENT_EMAIL") %>' runat="server" ID="STUDENT_EMAILLabel" /><br />
                        Password:
                    <asp:Label Text='<%# Eval("PASSWORD") %>' runat="server" ID="PASSWORDLabel" /><br />
                        Profile:
                    <asp:Label Text='<%# Eval("PROFILE") %>' runat="server" ID="Label1" /><br />
                        <br />
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource runat="server" ID="FIltered" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT STUDENT_ID, STUDENT_NAME, STUDENT_EMAIL, "PASSWORD", PROFILE FROM STUDENT WHERE (STUDENT_ID = :student)'>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" DefaultValue="STU1" Name="student"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
     <div class="w-100 mt-4">
         <h3 class="fs-6 fw-semibold">Enroled Courses Detail</h3>
         <asp:GridView ID="GridView1" CssClass="w-100 mt-3" AlternatingRowStyle-BackColor="#FAFAFA" RowStyle-CssClass=" border-bottom" HeaderStyle-Font-Size="Larger" HeaderStyle-BackColor="#1b6ee2" HeaderStyle-ForeColor="White" BorderStyle="Groove" CellPadding="7" GridLines="Horizontal" PagerStyle-BorderWidth="4"  runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1">
             <Columns>
                 <asp:BoundField DataField="COURSE_ID" HeaderText="Course Id" ReadOnly="True" SortExpression="COURSE_ID"></asp:BoundField>
                 <asp:BoundField DataField="COURSE_TITLE" HeaderText="Course Title" SortExpression="COURSE_TITLE"></asp:BoundField>
                 <asp:BoundField DataField="RELASE_DATE" HeaderText="Release Date" SortExpression="RELASE_DATE"></asp:BoundField>
                 <asp:BoundField DataField="DURATION" HeaderText="Duration" SortExpression="DURATION"></asp:BoundField>
                  <asp:BoundField DataField="ENROLLED_DATE" HeaderText="Enrolled Date" SortExpression="ENROLLED_DATE"></asp:BoundField>
             </Columns>
         </asp:GridView>
         <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="select c.course_id, c.course_title, c.relase_date ,c.duration, e.enrolled_date from enrolment e join course c on c.course_id=e.course_id where e.student_id=:student">
             <SelectParameters>
                 <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" DefaultValue="STU1" Name="student"></asp:ControlParameter>
             </SelectParameters>
         </asp:SqlDataSource>
     </div>
      
    </div>
      
   
</asp:Content>
