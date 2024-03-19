<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="ClassroomCoursework.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="QUESTION_ID" DataSourceID="Questions">
       
        <InsertItemTemplate>
            <div class="w-100" style="z-index: 9999;">
                <div class="d-flex flex-column gap-3 border-2 rounded-4 bg-light px-3 py-4 shadow-lg"
                    style="width: 450px; position: absolute; top: 50px; right: 430px; z-index: 99;">
                    <h2 class=" fs-4 mb-1 text-primary px-3">Add New Question</h2>

                    <div class=" row px-3">
                        <label class="form-label">Question Id</label>
                        <asp:TextBox Text='<%# Bind("QUESTION_ID") %>' CssClass=" form-control" runat="server" ID="QUESTION_IDTextBox" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Select Student</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass=" w-100 rounded-1 px-2 py-2 border border-2" DataSourceID="Students" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="Students" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "STUDENT_ID", "STUDENT_NAME" FROM "STUDENT"'></asp:SqlDataSource>
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Select Course</label>
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass=" w-100 rounded-1 px-2 py-2 border border-2" DataSourceID="Course" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="Course" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "COURSE_ID", "COURSE_TITLE" FROM "COURSE"'></asp:SqlDataSource>
                    </div>
                     <div class=" row px-3">
                       <label class="form-label">Question</label>
                        <asp:TextBox Text='<%# Bind("QUESTION_CONTENT") %>' CssClass=" form-control" runat="server" ID="QUESTION_CONTENTTextBox" /><br />
                   </div>
                    <div class=" row px-3">
                        <label class="form-label">Select Date</label>
                        <asp:TextBox Text='<%# Bind("DATE_CREATED") %>' CssClass=" form-control" TextMode="Date" runat="server" ID="DATE_CREATEDTextBox" /><br />
                    </div>

                    <div class=" w-100 d-flex align-items-center justify-content-end gap-3">
                        <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-outline-danger" ID="LinkButton1" CausesValidation="False" />
                        <asp:LinkButton runat="server" Text="Save" CssClass="btn btn-primary" CommandName="Insert" ID="LinkButton2" CausesValidation="True" />
                    </div>
                    </div>
            </div>
        </InsertItemTemplate>
        <ItemTemplate>

            <div class=" fs-4 fw-bolder text-primary">Question Asked</div>
            <div class=" w-auto d-flex justify-content-end align-items-center position-absolute" style="top: 69px; right: 36px;">
                <asp:LinkButton runat="server" CssClass="btn btn-primary px-4" Text="Add New Question" CommandName="New" ID="NewButton" CausesValidation="False" />
            </div>
        </ItemTemplate>
    </asp:FormView>


    <div class=" w-100 mt-3">
    <asp:GridView ID="GridView1" CssClass="w-100 mt-3" AlternatingRowStyle-BackColor="#FAFAFA" RowStyle-CssClass=" border-bottom" HeaderStyle-Font-Size="Larger" HeaderStyle-BackColor="#1b6ee2" HeaderStyle-ForeColor="White" BorderStyle="Groove" CellPadding="7" GridLines="Horizontal" PagerStyle-BorderWidth="4" runat="server" AutoGenerateColumns="False" DataKeyNames="QUESTION_ID" DataSourceID="Questions">
        <Columns>
            <asp:BoundField DataField="QUESTION_ID" HeaderText="Question Id" ReadOnly="True" SortExpression="QUESTION_ID"></asp:BoundField>
            <asp:BoundField DataField="STUDENT_ID" HeaderText="Student Id" SortExpression="STUDENT_ID"></asp:BoundField>
             <asp:TemplateField HeaderText="Student Name">
     <ItemTemplate>
         <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="Students" Enabled="false" CssClass="p-2 rounded-2 " DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'></asp:DropDownList>
         <asp:SqlDataSource runat="server" ID="Students" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "STUDENT_ID", "STUDENT_NAME" FROM "STUDENT"'></asp:SqlDataSource>
     </ItemTemplate>
 </asp:TemplateField>
            <asp:BoundField DataField="COURSE_ID" HeaderText="Course Id" SortExpression="COURSE_ID"></asp:BoundField>
            <asp:TemplateField HeaderText="Course Title">
                <ItemTemplate>
                    <asp:DropDownList Enabled="false" ID="DropDownList3" CssClass="p-2 rounded-2 " runat="server" DataSourceID="CourseList" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID"  SelectedValue='<%# Bind("COURSE_ID") %>'></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="CourseList" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "COURSE_ID", "COURSE_TITLE" FROM "COURSE"'></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="QUESTION_CONTENT" HeaderText="Question Content" SortExpression="QUESTION_CONTENT"></asp:BoundField>
            <asp:BoundField DataField="DATE_CREATED" HeaderText="Created At" SortExpression="DATE_CREATED"></asp:BoundField>
            <asp:CommandField UpdateText="Save" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" ItemStyle-CssClass=" d-flex gap-2"></asp:CommandField>
            <asp:CommandField ControlStyle-CssClass="btn btn-danger" ShowDeleteButton="True"></asp:CommandField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="Questions" ConnectionString='<%$ ConnectionStrings:elearning %>' DeleteCommand='DELETE FROM "QUESTION" WHERE "QUESTION_ID" = :QUESTION_ID' InsertCommand='INSERT INTO "QUESTION" ("QUESTION_ID", "STUDENT_ID", "COURSE_ID", "QUESTION_CONTENT", "DATE_CREATED") VALUES (:QUESTION_ID, :STUDENT_ID, :COURSE_ID, :QUESTION_CONTENT, :DATE_CREATED)' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT * FROM "QUESTION"' UpdateCommand='UPDATE "QUESTION" SET "STUDENT_ID" = :STUDENT_ID, "COURSE_ID" = :COURSE_ID, "QUESTION_CONTENT" = :QUESTION_CONTENT, "DATE_CREATED" = :DATE_CREATED WHERE "QUESTION_ID" = :QUESTION_ID'>
        <DeleteParameters>
            <asp:Parameter Name="QUESTION_ID" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="QUESTION_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="QUESTION_CONTENT" Type="String"></asp:Parameter>
            <asp:Parameter Name="DATE_CREATED" Type="DateTime"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="QUESTION_CONTENT" Type="String"></asp:Parameter>
            <asp:Parameter Name="DATE_CREATED" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="QUESTION_ID" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
        </div>
</asp:Content>
