<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Enrolment.aspx.cs" Inherits="ClassroomCoursework.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID,STUDENT_ID" DataSourceID="ListEn">
        <InsertItemTemplate>
            <div class="w-100" style="z-index: 9999;">
                <div class="d-flex flex-column gap-3 border-2 rounded-4 bg-light px-3 py-4 shadow-lg"
                    style="width: 450px; position: absolute; top: 60px; right: 430px; z-index: 99;">
                    <h2 class=" fs-4 mb-1 px-3 text-primary">Enroll New Student</h2>
                    <div class=" row px-3">
                        <label class="form-label">Select Course</label>
                        <asp:DropDownList ID="DropDownList3" CssClass=" w-100 rounded-1 px-2 py-2 border-light border-2" runat="server" DataSourceID="CourseList" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="CourseList" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "COURSE_ID", "COURSE_TITLE" FROM "COURSE"'></asp:SqlDataSource>
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Select Student</label>
                        <asp:DropDownList ID="DropDownList4" CssClass=" w-100 rounded-1 px-2 py-2 border-light border-2" runat="server" DataSourceID="Studentss" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="Studentss" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "STUDENT_ID", "STUDENT_NAME" FROM "STUDENT"'></asp:SqlDataSource>
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Enroll Date</label>
                        <asp:TextBox CssClass=" form-control" Text='<%# Bind("ENROLLED_DATE") %>' TextMode="Date" runat="server" ID="ENROLLED_DATETextBox" /><br />
                    </div>

                    <div class=" w-100 mt-2 d-flex align-items-center justify-content-end gap-3">
                        <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-outline-danger" ID="LinkButton1" CausesValidation="False" />
                        <asp:LinkButton runat="server" Text="Save" CssClass="btn btn-primary" CommandName="Insert" ID="LinkButton2" CausesValidation="True" />
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
        <ItemTemplate>
            <div class=" fs-4 fw-bolder text-primary">Enrollment Information</div>
            <div class=" w-auto d-flex justify-content-end align-items-center position-absolute" style="top: 69px; right: 36px;">
                <asp:LinkButton runat="server" CssClass="btn btn-primary px-4" Text="Enroll Student" CommandName="New" ID="LinkButton1" CausesValidation="False" />
            </div>
        </ItemTemplate>
    </asp:FormView>


    <asp:SqlDataSource runat="server" ID="ListEn" ConnectionString='<%$ ConnectionStrings:elearning %>' DeleteCommand='DELETE FROM "ENROLMENT" WHERE "COURSE_ID" = :COURSE_ID AND "STUDENT_ID" = :STUDENT_ID' InsertCommand='INSERT INTO "ENROLMENT" ("COURSE_ID", "STUDENT_ID", "ENROLLED_DATE") VALUES (:COURSE_ID, :STUDENT_ID, :ENROLLED_DATE)' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT * FROM "ENROLMENT"' UpdateCommand='UPDATE "ENROLMENT" SET "ENROLLED_DATE" = :ENROLLED_DATE WHERE "COURSE_ID" = :COURSE_ID AND "STUDENT_ID" = :STUDENT_ID'>
        <DeleteParameters>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="ENROLLED_DATE" Type="DateTime"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ENROLLED_DATE" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="EnrolEDit"></asp:SqlDataSource>
    <div class="w-100 d-flex flex-column mt-3">
        <asp:GridView ID="GridView1" CssClass="w-100 mt-3" AlternatingRowStyle-BackColor="#FAFAFA" RowStyle-CssClass=" border-bottom" HeaderStyle-Font-Size="Larger" HeaderStyle-BackColor="#1b6ee2" HeaderStyle-ForeColor="White" BorderStyle="Groove" CellPadding="7" GridLines="Horizontal" PagerStyle-BorderWidth="4" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID,STUDENT_ID" DataSourceID="Enrollment">
            <Columns>
                <asp:TemplateField HeaderText="Course Name">
                    <ItemTemplate>
                        <asp:DropDownList Enabled="false" CssClass=" p-2" SelectedValue='<%# Bind("COURSE_ID") %>' ID="DropDownList2" runat="server" DataSourceID="Courses" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="Courses" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "COURSE_ID", "COURSE_TITLE" FROM "COURSE"'></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="COURSE_ID" HeaderText="Course Id" ReadOnly="True" SortExpression="COURSE_ID"></asp:BoundField>
                <asp:TemplateField HeaderText="Student Name">
                    <ItemTemplate>
                        <asp:DropDownList Enabled="false" CssClass="p-2" SelectedValue='<%# Bind("STUDENT_ID") %>' ID="DropDownList1" runat="server" DataSourceID="Stu" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="Stu" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "STUDENT_ID", "STUDENT_NAME" FROM "STUDENT"'></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="STUDENT_ID" HeaderText="Student Id" ReadOnly="True" SortExpression="STUDENT_ID"></asp:BoundField>
                <asp:BoundField DataField="ENROLLED_DATE" HeaderText="Enrolled Date" SortExpression="ENROLLED_DATE"></asp:BoundField>
                <asp:CommandField UpdateText="Save" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" ItemStyle-CssClass=" d-flex gap-2"></asp:CommandField>
                <asp:CommandField ControlStyle-CssClass="btn btn-danger" ShowDeleteButton="True"></asp:CommandField>

            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource runat="server" ID="Enrollment" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT * FROM "ENROLMENT"' DeleteCommand='DELETE FROM "ENROLMENT" WHERE "COURSE_ID" = :COURSE_ID AND "STUDENT_ID" = :STUDENT_ID' InsertCommand='INSERT INTO "ENROLMENT" ("COURSE_ID", "STUDENT_ID", "ENROLLED_DATE") VALUES (:COURSE_ID, :STUDENT_ID, :ENROLLED_DATE)' UpdateCommand='UPDATE "ENROLMENT" SET "ENROLLED_DATE" = :ENROLLED_DATE WHERE "COURSE_ID" = :COURSE_ID AND "STUDENT_ID" = :STUDENT_ID'>
        <DeleteParameters>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="ENROLLED_DATE" Type="DateTime"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ENROLLED_DATE" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    
</asp:Content>
