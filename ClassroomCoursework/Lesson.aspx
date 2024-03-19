<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lesson.aspx.cs" Inherits="ClassroomCoursework.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="LESSON_NO,COURSE_ID" DataSourceID="Lessons">

        <InsertItemTemplate>
            <div class="w-100" style="z-index: 9999;">
                <div class="d-flex flex-column gap-2 border-2 rounded-4 bg-light px-3 py-4 shadow-lg"
                    style="width: 450px; position: absolute; top: 50px; right: 430px; z-index: 99;">
                    <h2 class=" fs-4 mb-1 px-3 text-primary">Add New Lesson</h2>
                    <div class=" row px-3">
                        <label class="form-label">LESSON NO</label>
                        <asp:TextBox Text='<%# Bind("LESSON_NO") %>' CssClass=" form-control" runat="server" ID="LESSON_NOTextBox" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">SELECT COURSE</label>
                        <asp:DropDownList ID="DropDownList1" CssClass=" w-100 rounded-1 px-2 py-2 border border-2" runat="server" DataSourceID="EditCourse" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="EditCourse" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "COURSE_ID", "COURSE_TITLE" FROM "COURSE"'></asp:SqlDataSource>
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">LESSON TITLE</label>
                        <asp:TextBox Text='<%# Bind("LESSON_TITLE") %>' CssClass=" form-control" runat="server" ID="LESSON_TITLETextBox" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">CONTENT TYPE</label>
                        <asp:TextBox Text='<%# Bind("CONTENT_TYPE") %>' CssClass=" form-control" runat="server" ID="CONTENT_IDTextBox" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">CONTENT URL</label>
                        <asp:TextBox Text='<%# Bind("CONTENT_URL") %>' CssClass=" form-control" runat="server" ID="TextBox1" /><br />
                    </div>
                    <div class=" w-100 mt-2 d-flex align-items-center justify-content-end gap-3">
                        <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-outline-danger" ID="LinkButton1" CausesValidation="False" />
                        <asp:LinkButton runat="server" Text="Save" CssClass="btn btn-primary" CommandName="Insert" ID="LinkButton2" CausesValidation="True" />
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
        <ItemTemplate>
            <div class=" fs-4 fw-bolder text-primary">Lessons Information</div>
            <div class=" w-auto d-flex justify-content-end align-items-center position-absolute" style="top: 69px; right: 36px;">
                <asp:LinkButton runat="server" CssClass="btn btn-primary px-4" Text="Add New Lesson" CommandName="New" ID="NewButton" CausesValidation="False" />
            </div>
        </ItemTemplate>
    </asp:FormView>




    <div class=" w-100 flex-column d-flex mt-2">
        <asp:GridView ID="GridView1" CssClass="w-100 mt-3" AlternatingRowStyle-BackColor="#FAFAFA" RowStyle-CssClass=" border-bottom" HeaderStyle-Font-Size="Larger" HeaderStyle-BackColor="#1b6ee2" HeaderStyle-ForeColor="White" BorderStyle="Groove" CellPadding="7" GridLines="Horizontal" PagerStyle-BorderWidth="4" runat="server" AutoGenerateColumns="False" DataKeyNames="LESSON_NO,COURSE_ID" DataSourceID="Lessons">
            <Columns>

                <asp:BoundField DataField="LESSON_NO" HeaderText="Lesson No" ReadOnly="True" SortExpression="LESSON_NO"></asp:BoundField>
                <asp:BoundField DataField="COURSE_ID" HeaderText="Course Id" ReadOnly="True" SortExpression="COURSE_ID"></asp:BoundField>
                <asp:TemplateField HeaderText="Course Title">
                    <ItemTemplate>
                        <asp:DropDownList Enabled="false" CssClass=" w-100 rounded-1 px-2 py-2 border border-2" ID="DropDownList2" runat="server" DataSourceID="Cou" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="Cou" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "COURSE_ID", "COURSE_TITLE" FROM "COURSE"'></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="LESSON_TITLE" HeaderText="Lesson Title" SortExpression="LESSON_TITLE"></asp:BoundField>
                <asp:BoundField DataField="CONTENT_TYPE" HeaderText="Content Type" SortExpression="CONTENT_TYPE"></asp:BoundField>
                <asp:BoundField DataField="CONTENT_URL" HeaderText="Content Url" SortExpression="CONTENT_URL"></asp:BoundField>
                <asp:CommandField UpdateText="Save" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" ItemStyle-CssClass=" d-flex gap-2"></asp:CommandField>
                <asp:CommandField ControlStyle-CssClass="btn btn-danger" ShowDeleteButton="True"></asp:CommandField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource runat="server" ID="Lessons" ConnectionString='<%$ ConnectionStrings:elearning %>' DeleteCommand='DELETE FROM "LESSON" WHERE "LESSON_NO" = :LESSON_NO AND "COURSE_ID" = :COURSE_ID' InsertCommand='INSERT INTO "LESSON" ("LESSON_NO", "COURSE_ID", "LESSON_TITLE", "CONTENT_TYPE", "CONTENT_URL") VALUES (:LESSON_NO, :COURSE_ID, :LESSON_TITLE, :CONTENT_TYPE, :CONTENT_URL)' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT * FROM "LESSON"' UpdateCommand='UPDATE "LESSON" SET  "COURSE_ID"=:COURSE_ID, "LESSON_TITLE" = :LESSON_TITLE, "CONTENT_TYPE" = :CONTENT_TYPE, "CONTENT_URL"=:CONTENT_URL WHERE "LESSON_NO" = :LESSON_NO AND "COURSE_ID" = :COURSE_ID'>
        <DeleteParameters>
            <asp:Parameter Name="LESSON_NO" Type="String"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LESSON_NO" Type="String"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="LESSON_TITLE" Type="String"></asp:Parameter>
            <asp:Parameter Name="CONTENT_TYPE" Type="String"></asp:Parameter>
            <asp:Parameter Name="CONTENT_URL" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LESSON_TITLE" Type="String"></asp:Parameter>
            <asp:Parameter Name="CONTENT_TYPE" Type="String"></asp:Parameter>
            <asp:Parameter Name="CONTENT_URL" Type="String"></asp:Parameter>
            <asp:Parameter Name="LESSON_NO" Type="String"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
