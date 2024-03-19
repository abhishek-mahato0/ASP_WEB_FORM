<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="ClassroomCoursework.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID" DataSourceID="Students">

        <InsertItemTemplate>
            <div class="w-100" style="z-index: 9999;">
                <div class="d-flex flex-column gap-2 border-2 rounded-4 bg-light px-3 py-4 shadow-lg"
                    style="width: 450px; position: absolute; top: 50px; right: 430px; z-index: 99;">
                    <h2 class=" fs-4 px-3 text-primary mb-1">Add New Student</h2>
                    <div class=" row px-3">
                        <label class="form-label">Student Id</label>
                        <asp:TextBox Text='<%# Bind("STUDENT_ID") %>' CssClass="form-control" runat="server" ID="STUDENT_IDTextBox" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Student Name</label>

                        <asp:TextBox Text='<%# Bind("STUDENT_NAME") %>' CssClass="form-control" runat="server" ID="SUDENT_NAMETextBox" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Student Email</label>

                        <asp:TextBox Text='<%# Bind("STUDENT_EMAIL") %>' CssClass="form-control" runat="server" ID="STUDENT_EMAILTextBox" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Password</label>
                        <asp:TextBox Text='<%# Bind("PASSWORD") %>' CssClass="form-control" runat="server" ID="PASSWORDTextBox" /><br />

                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Profile</label>
                        <asp:TextBox Text='<%# Bind("PROFILE") %>' CssClass="form-control" runat="server" ID="TextBox7" /><br />
                    </div>
                    <div class=" w-100 mt-2 d-flex align-items-center justify-content-end gap-3 mt-3">
                        <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-outline-danger" ID="LinkButton1" CausesValidation="False" />
                        <asp:LinkButton runat="server" Text="Save" CssClass="btn btn-primary" CommandName="Insert" ID="LinkButton2" CausesValidation="True" />
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
        <ItemTemplate>
            <div class=" fs-4 fw-bolder text-primary">Students Information</div>
            <div class=" w-auto d-flex justify-content-end align-items-center position-absolute" style="top: 69px; right: 36px;">
                <asp:LinkButton runat="server" CssClass="btn btn-primary px-4" Text="Add New Student" CommandName="New" ID="NewButton" CausesValidation="False" />
            </div>
        </ItemTemplate>
    </asp:FormView>


     <div class="w-100 d-flex flex-column gap-2 mt-3 text-black">
         <asp:GridView ID="GridView1" CssClass="w-100 mt-3" AlternatingRowStyle-BackColor="#FAFAFA" RowStyle-CssClass=" border-bottom" HeaderStyle-Font-Size="Larger" HeaderStyle-BackColor="#1b6ee2" HeaderStyle-ForeColor="White" BorderStyle="Groove" CellPadding="7" GridLines="Horizontal" PagerStyle-BorderWidth="4" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="Students">
        <Columns>
            <asp:BoundField DataField="STUDENT_ID" HeaderText="Student Id" ReadOnly="True" SortExpression="STUDENT_ID"></asp:BoundField>
            <asp:BoundField DataField="STUDENT_NAME" HeaderText="Student Name" SortExpression="SUDENT_NAME"></asp:BoundField>
            <asp:BoundField DataField="STUDENT_EMAIL" HeaderText="Student Email" SortExpression="STUDENT_EMAIL"></asp:BoundField>
            <asp:BoundField DataField="PASSWORD" HeaderText="Password" SortExpression="PASSWORD"></asp:BoundField>
            <asp:BoundField DataField="PROFILE" HeaderText="Profile" SortExpression="PROFILE"></asp:BoundField>
            <asp:CommandField UpdateText="Save" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" ItemStyle-CssClass=" d-flex gap-2"></asp:CommandField>
            <asp:CommandField ControlStyle-CssClass="btn btn-danger" ShowDeleteButton="True"></asp:CommandField>
        </Columns>
    </asp:GridView>
         </div>

    <asp:SqlDataSource runat="server" ID="Students" ConnectionString='<%$ ConnectionStrings:elearning %>' DeleteCommand='DELETE FROM "STUDENT" WHERE "STUDENT_ID" = :STUDENT_ID' InsertCommand='INSERT INTO "STUDENT" ("STUDENT_ID", "STUDENT_NAME", "STUDENT_EMAIL", "PASSWORD", "PROFILE") VALUES (:STUDENT_ID, :STUDENT_NAME, :STUDENT_EMAIL, :PASSWORD, :PROFILE)' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT * FROM "STUDENT"' UpdateCommand='UPDATE "STUDENT" SET "STUDENT_NAME" = :STUDENT_NAME, "STUDENT_EMAIL" = :STUDENT_EMAIL, "PASSWORD" = :PASSWORD, "PROFILE"=:PROFILE WHERE "STUDENT_ID" = :STUDENT_ID'>
        <DeleteParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_NAME" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_EMAIL" Type="String"></asp:Parameter>
            <asp:Parameter Name="PASSWORD" Type="String"></asp:Parameter>
            <asp:Parameter Name="PROFILE" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="STUDENT_NAME" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_EMAIL" Type="String"></asp:Parameter>
            <asp:Parameter Name="PASSWORD" Type="String"></asp:Parameter>
            <asp:Parameter Name="PROFILE" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
