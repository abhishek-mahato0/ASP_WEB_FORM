<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="ClassroomCoursework.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="INSTRUCTOR_ID" DataSourceID="Instructor">
        <InsertItemTemplate>
            <div class="w-100" style="z-index: 9999;">
                <div class="d-flex flex-column gap-2 border-2 rounded-4 bg-light px-3 py-4 shadow-lg"
                    style="width: 450px; position: absolute; top: 68px; right: 530px; z-index: 99;">
                    <h2 class=" fs-4 mb-1 px-3 text-primary">Add New Instructor</h2>
                    <div class=" row px-3">
                        <label class=" form-label">Instructor Id</label>
                        <asp:TextBox Text='<%# Bind("INSTRUCTOR_ID") %>' CssClass=" form-control" runat="server" ID="INSTRUCTOR_IDTextBox" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Instructor Name</label>
                        <asp:TextBox Text='<%# Bind("INSTRUCTOR_NAME") %>' runat="server" CssClass=" form-control" ID="INSTRUCTOR_NAMETextBox" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class=" form-label">Select Course</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass=" w-100 rounded-1 px-2 py-2 border border-2" DataSourceID="CourseList" DataTextField="COUSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="CourseList" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand="SELECT course_id, course_id ||' : '|| course_title AS couse_title FROM course"></asp:SqlDataSource>
                        </div>
                    <div class=" row px-3">
                        <label class=" form-label">Instructor Email</label>
                            <asp:TextBox Text='<%# Bind("INSTRUCTOR_EMAIL") %>' CssClass=" form-control" TextMode="Email" runat="server" ID="INSTRUCTOR_EMAILTextBox" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class=" form-label">Password</label>

                        <asp:TextBox Text='<%# Bind("PASSWORD") %>' CssClass=" form-control" runat="server" TextMode="Password" ID="PASSWORDTextBox" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class=" form-label">Joined Date</label>
                        <asp:TextBox Text='<%# Bind("JOINED_DATE") %>' CssClass=" form-control" TextMode="Date" runat="server" ID="TextBox1" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class=" form-label">Profile</label>

                        <asp:TextBox Text='<%# Bind("PROFILE") %>' CssClass=" form-control" runat="server" ID="PFOFILE1" /><br />
                    </div>


                    <div class=" w-100 d-flex align-items-center justify-content-end gap-3 mt-2">
                        <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-outline-danger" ID="LinkButton1" CausesValidation="False" />
                        <asp:LinkButton runat="server" Text="Save" CssClass="btn btn-primary" CommandName="Insert" ID="LinkButton2" CausesValidation="True" />
                    </div>

                </div>
            </div>

        </InsertItemTemplate>
        <ItemTemplate>
           <div class=" fs-4 fw-bolder text-primary">Instructor Infomation</div>
            <div class=" w-auto d-flex justify-content-end align-items-center position-absolute" style="top: 69px; right: 36px;">
                <asp:LinkButton runat="server" CssClass="btn btn-primary px-4" Text="Add New Instructor" CommandName="New" ID="NewButton" CausesValidation="False" />
            </div>
        </ItemTemplate>
    </asp:FormView>



    <div class="w-100 d-flex flex-column gap-2 mt-3">
        <asp:GridView ID="GridView1" CssClass="w-100 mt-3" AlternatingRowStyle-BackColor="#FAFAFA" RowStyle-CssClass=" border-bottom" HeaderStyle-Font-Size="Larger" HeaderStyle-BackColor="#1b6ee2" HeaderStyle-ForeColor="White" BorderStyle="Groove" CellPadding="7" GridLines="Horizontal" PagerStyle-BorderWidth="4" runat="server" AutoGenerateColumns="False" DataKeyNames="INSTRUCTOR_ID" DataSourceID="Instructor">
            <Columns>

                <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="Id" ReadOnly="True" SortExpression="INSTRUCTOR_ID"></asp:BoundField>
                <asp:BoundField DataField="INSTRUCTOR_EMAIL" HeaderText="Email" SortExpression="INSTRUCTOR_EMAIL"></asp:BoundField>
                <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="Name" SortExpression="INSTRUCTOR_NAME"></asp:BoundField>

                <asp:BoundField DataField="PASSWORD" HeaderText="Password" SortExpression="PASSWORD"></asp:BoundField>
                <asp:BoundField DataField="COURSE_ID" HeaderText="Course Id" SortExpression="COURSE_ID"></asp:BoundField>
                <asp:TemplateField HeaderText="Course Title">
                    <ItemTemplate>
                        <asp:DropDownList Enabled="false" CssClass="px-2 py-1" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "COURSE_ID", "COURSE_TITLE" FROM "COURSE"'></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="JOINED_DATE" HeaderText="Joined Date" SortExpression="JOINED_DATE"></asp:BoundField>
                <asp:BoundField DataField="PROFILE" HeaderText="Profile" SortExpression="PROFILE"></asp:BoundField>
                <asp:CommandField UpdateText="Save" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" ItemStyle-CssClass=" d-flex gap-2"></asp:CommandField>
                <asp:CommandField ControlStyle-CssClass="btn btn-danger" ShowDeleteButton="True"></asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="Instructor" ConnectionString='<%$ ConnectionStrings:elearning %>' DeleteCommand='DELETE FROM "INSTRUCTOR" WHERE "INSTRUCTOR_ID" = :INSTRUCTOR_ID' InsertCommand='INSERT INTO "INSTRUCTOR" ("INSTRUCTOR_ID", "INSTRUCTOR_NAME", "COURSE_ID", "INSTRUCTOR_EMAIL", "PASSWORD", "PROFILE", "JOINED_DATE") VALUES (:INSTRUCTOR_ID, :INSTRUCTOR_NAME, :COURSE_ID, :INSTRUCTOR_EMAIL, :PASSWORD, :PROFILE, :JOINED_DATE)' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT * FROM "INSTRUCTOR"' UpdateCommand='UPDATE "INSTRUCTOR" SET "INSTRUCTOR_NAME" = :INSTRUCTOR_NAME, "COURSE_ID" = :COURSE_ID, "INSTRUCTOR_EMAIL" = :INSTRUCTOR_EMAIL, "PASSWORD" = :PASSWORD, "PROFILE"=:PROFILE, "JOINED_DATE"=:JOINED_DATE WHERE "INSTRUCTOR_ID" = :INSTRUCTOR_ID'>
            <DeleteParameters>
                <asp:Parameter Name="INSTRUCTOR_ID" Type="String"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="INSTRUCTOR_ID" Type="String"></asp:Parameter>
                <asp:Parameter Name="INSTRUCTOR_NAME" Type="String"></asp:Parameter>
                <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
                <asp:Parameter Name="INSTRUCTOR_EMAIL" Type="String"></asp:Parameter>
                <asp:Parameter Name="PASSWORD" Type="String"></asp:Parameter>
                <asp:Parameter Name="JOINED_DATE" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="PROFILE" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="INSTRUCTOR_NAME" Type="String"></asp:Parameter>
                <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
                <asp:Parameter Name="INSTRUCTOR_EMAIL" Type="String"></asp:Parameter>
                <asp:Parameter Name="PASSWORD" Type="String"></asp:Parameter>
                <asp:Parameter Name="JOINED_DATE" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="PROFILE" Type="String"></asp:Parameter>
                <asp:Parameter Name="INSTRUCTOR_ID" Type="String"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand='DELETE FROM "INSTRUCTOR" WHERE "INSTRUCTOR_ID" = :INSTRUCTOR_ID' InsertCommand='INSERT INTO "INSTRUCTOR" ("INSTRUCTOR_ID", "INSTRUCTOR_NAME", "COURSE_ID", "INSTRUCTOR_EMAIL") VALUES (:INSTRUCTOR_ID, :INSTRUCTOR_NAME, :COURSE_ID, :INSTRUCTOR_EMAIL)' ProviderName='<%$ ConnectionStrings:ConnectionString.ProviderName %>' SelectCommand='SELECT "INSTRUCTOR_ID", "INSTRUCTOR_NAME", "COURSE_ID", "INSTRUCTOR_EMAIL" FROM "INSTRUCTOR"' UpdateCommand='UPDATE "INSTRUCTOR" SET "INSTRUCTOR_NAME" = :INSTRUCTOR_NAME, "COURSE_ID" = :COURSE_ID, "INSTRUCTOR_EMAIL" = :INSTRUCTOR_EMAIL WHERE "INSTRUCTOR_ID" = :INSTRUCTOR_ID'>
        <DeleteParameters>
            <asp:Parameter Name="INSTRUCTOR_ID" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="INSTRUCTOR_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="INSTRUCTOR_NAME" Type="String"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="INSTRUCTOR_EMAIL" Type="String"></asp:Parameter>
                <asp:Parameter Name="JOINED_DATE" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="PROFILE" Type="String"></asp:Parameter>

        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="INSTRUCTOR_NAME" Type="String"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="INSTRUCTOR_EMAIL" Type="String"></asp:Parameter>
            <asp:Parameter Name="INSTRUCTOR_ID" Type="String"></asp:Parameter>
                <asp:Parameter Name="JOINED_DATE" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="PROFILE" Type="String"></asp:Parameter>

        </UpdateParameters>
    </asp:SqlDataSource>


</asp:Content>
