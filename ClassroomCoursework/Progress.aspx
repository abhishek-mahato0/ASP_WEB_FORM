<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Progress.aspx.cs" Inherits="ClassroomCoursework.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="LESSON_NO,STUDENT_ID,COURSE_ID" DataSourceID="Progress">

        <InsertItemTemplate>
            <div class="w-100" style="z-index: 9999;">
                <div class="d-flex flex-column gap-3 border-2 rounded-4 bg-light px-3 py-4 shadow-lg"
                    style="width: 450px; position: absolute; top: 50px; right: 430px; z-index: 99;">
                    <h2 class=" fs-4 mb-1 px-3 text-primary">Add New Progress</h2>
                    <div class=" row px-3">
                        <label class="form-label">Select Course</label>
                        <asp:DropDownList ID="CourseDropDown" runat="server" CssClass=" w-100 rounded-1 px-2 py-2 border border-2" DataSourceID="CourseList" AutoPostBack="true" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="CourseList" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="SELECT DISTINCT c.COURSE_ID, c.COURSE_TITLE FROM COURSE c, LESSON l WHERE c.COURSE_ID = l.COURSE_ID"></asp:SqlDataSource>
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Select Lesson </label>
                        <asp:DropDownList ID="DropDownList3" CssClass=" w-100 rounded-1 px-2 py-2 border border-2" runat="server" DataSourceID="LesonList" DataTextField="LESSON_TITLE" DataValueField="LESSON_NO" SelectedValue='<%# Bind("LESSON_NO") %>'></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="LesonList" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "LESSON_NO", "LESSON_TITLE" FROM "LESSON"'></asp:SqlDataSource>
                        <asp:SqlDataSource runat="server" ID="LessonList"></asp:SqlDataSource>
                    </div>
                  
                    <div class=" row px-3">
                        <label class="form-label">Select Student</label>
                        <asp:DropDownList ID="DropDownListStudents" CssClass=" w-100 rounded-1 px-2 py-2 border border-2" runat="server" DataSourceID="SSTL" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SSTL" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "STUDENT_NAME", "STUDENT_ID" FROM "STUDENT"'></asp:SqlDataSource>
                    </div>


                    <div class=" row px-3">
                        <label class="form-label">Lesson Status</label>
                        <asp:TextBox CssClass="form-control" Text='<%# Bind("LESSON_STATUS") %>' runat="server" ID="LESSON_STATUSTextBox" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Last Accessed Date</label>
                        <asp:TextBox CssClass="form-control" Text='<%# Bind("LAST_ACCESS_DATE") %>' TextMode="Date" runat="server" ID="LAST_ACCESS_DATETextBox" /><br />
                    </div>
                    <div class=" w-100 d-flex align-items-center justify-content-end gap-3">
                        <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-outline-danger" ID="LinkButton1" CausesValidation="False" />
                        <asp:LinkButton runat="server" Text="Save" CssClass="btn btn-primary" CommandName="Insert" ID="LinkButton2" CausesValidation="True" />
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
        <ItemTemplate>
            <div class=" fs-4 fw-bolder text-primary">Progress Information</div>
            <div class=" w-auto d-flex justify-content-end align-items-center position-absolute" style="top: 69px; right: 36px;">
                <asp:LinkButton runat="server" CssClass="btn btn-primary px-4" Text="Add New Progress" CommandName="New" ID="NewButton" CausesValidation="False" />
            </div>
        </ItemTemplate>
    </asp:FormView>





    <div class ="w-100 mt-2 d-flex flex-column">
    <asp:GridView ID="GridView1" CssClass="w-100 mt-3" AlternatingRowStyle-BackColor="#FAFAFA" RowStyle-CssClass=" border-bottom" HeaderStyle-Font-Size="Larger" HeaderStyle-BackColor="#1b6ee2" HeaderStyle-ForeColor="White" BorderStyle="Groove" CellPadding="7" GridLines="Horizontal" PagerStyle-BorderWidth="4" runat="server" AutoGenerateColumns="False" DataKeyNames="LESSON_NO,STUDENT_ID,COURSE_ID" DataSourceID="Progress">
        <Columns>

            <asp:BoundField DataField="LESSON_NO" HeaderText="Lesson No" ReadOnly="True" SortExpression="LESSON_NO"></asp:BoundField>
            <asp:BoundField DataField="COURSE_ID" HeaderText="Course Id" ReadOnly="True" SortExpression="LESSON_NO"></asp:BoundField>
            <asp:TemplateField HeaderText="Student Name">

                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" CssClass="p-1" Enabled="false" runat="server" DataSourceID="Student" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="Student" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "STUDENT_ID", "STUDENT_NAME" FROM "STUDENT"'></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Course Title">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2"  CssClass="p-1" Enabled="false" runat="server" DataSourceID="Course" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="Course" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "COURSE_ID", "COURSE_TITLE" FROM "COURSE"'></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LESSON_STATUS" HeaderText="Lesson Status" SortExpression="LESSON_STATUS"></asp:BoundField>
            <asp:BoundField DataField="LAST_ACCESS_DATE" HeaderText="Last Access Date" SortExpression="LAST_ACCESS_DATE"></asp:BoundField>
            <asp:CommandField UpdateText="Save" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" ItemStyle-CssClass=" d-flex gap-2"></asp:CommandField>
            <asp:CommandField ControlStyle-CssClass="btn btn-danger" ShowDeleteButton="True"></asp:CommandField>
        </Columns>
    </asp:GridView>
        </div>
    <asp:SqlDataSource runat="server" ID="Progress" ConnectionString='<%$ ConnectionStrings:elearning %>' DeleteCommand='DELETE FROM "PROGRESS" WHERE "LESSON_NO" = :LESSON_NO AND "STUDENT_ID" = :STUDENT_ID AND "COURSE_ID" = :COURSE_ID' InsertCommand='INSERT INTO "PROGRESS" ("LESSON_NO", "STUDENT_ID", "COURSE_ID", "LESSON_STATUS", "LAST_ACCESS_DATE") VALUES (:LESSON_NO, :STUDENT_ID, :COURSE_ID, :LESSON_STATUS, :LAST_ACCESS_DATE)' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT * FROM "PROGRESS"' UpdateCommand='UPDATE "PROGRESS" SET "LESSON_STATUS" = :LESSON_STATUS, "LAST_ACCESS_DATE" = :LAST_ACCESS_DATE WHERE "LESSON_NO" = :LESSON_NO AND "STUDENT_ID" = :STUDENT_ID AND "COURSE_ID" = :COURSE_ID'>
        <DeleteParameters>
            <asp:Parameter Name="LESSON_NO" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LESSON_NO" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="LESSON_STATUS" Type="String"></asp:Parameter>
            <asp:Parameter Name="LAST_ACCESS_DATE" Type="DateTime"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LESSON_STATUS" Type="String"></asp:Parameter>
            <asp:Parameter Name="LAST_ACCESS_DATE" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="LESSON_NO" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
