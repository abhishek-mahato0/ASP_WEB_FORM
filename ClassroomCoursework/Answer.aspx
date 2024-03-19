<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Answer.aspx.cs" Inherits="ClassroomCoursework.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="REPLY_ID" DataSourceID="Reply">
       
        <InsertItemTemplate>
            <div class="w-100" style="z-index: 9999;">
                <div class="d-flex flex-column gap-3 border-2 rounded-4 bg-light px-3 py-4 shadow-lg"
                    style="width: 450px; position: absolute; top: 50px; right: 730px; z-index: 99;">
                    <h2 class=" fs-4 mb-1 text-primary px-3">Add Reply</h2>
                    <div class=" row px-3">
                        <label class="form-label">Select Instructor</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass=" w-100 rounded-1 px-2 py-2 border border-2" DataSourceID="Instructor" DataTextField="INSTRUCTOR_NAME" DataValueField="INSTRUCTOR_ID" SelectedValue='<%# Bind("INSTRUCTOR_ID") %>'></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="Instructor" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "INSTRUCTOR_ID", "INSTRUCTOR_NAME" FROM "INSTRUCTOR"'></asp:SqlDataSource>
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Reply Id</label>
                        <asp:TextBox Text='<%# Bind("REPLY_ID") %>' CssClass=" form-control" runat="server" ID="REPLY_IDTextBox" /><br />
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Select Question</label>
                        <asp:DropDownList ID="DropDownList2" CssClass=" w-100 rounded-1 px-2 py-2 border border-2" runat="server" DataSourceID="qq" DataTextField="QUESTION_CONTENT" DataValueField="QUESTION_ID" SelectedValue='<%# Bind("QUESTION_ID") %>'></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="qq" ConnectionString='<%$ ConnectionStrings:elearning %>' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT "QUESTION_ID", "QUESTION_CONTENT" FROM "QUESTION"'></asp:SqlDataSource>
                    </div>
                    <div class=" row px-3">
                        <label class="form-label">Content</label>
                        <asp:TextBox Text='<%# Bind("CONTENT") %>' CssClass=" form-control" runat="server" ID="CONTENTTextBox" /><br />
                    </div>

                    <div class=" row px-3">
                        <label class="form-label">Created Date</label>
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
            <div class=" fs-4 fw-bolder text-primary">Question's Reply</div>
            <div class="w-auto d-flex justify-content-end align-items-center position-absolute" style="top: 69px; right: 36px;">
                <asp:LinkButton runat="server" CssClass="btn btn-primary px-4" Text="Give A Reply" CommandName="New" ID="NewButton" CausesValidation="False" />
            </div>
        </ItemTemplate>
    </asp:FormView>
    
    <asp:GridView ID="GridView1" CssClass="w-100 mt-3" AlternatingRowStyle-BackColor="#FAFAFA" RowStyle-CssClass=" border-bottom" HeaderStyle-Font-Size="Larger" HeaderStyle-BackColor="#1b6ee2" HeaderStyle-ForeColor="White" BorderStyle="Groove" CellPadding="7" GridLines="Horizontal" PagerStyle-BorderWidth="4" runat="server" AutoGenerateColumns="False" DataKeyNames="REPLY_ID" DataSourceID="Reply">
        <Columns>
            <asp:BoundField DataField="REPLY_ID" HeaderText="Reply Id" ReadOnly="True" SortExpression="REPLY_ID"></asp:BoundField>
            <asp:BoundField DataField="CONTENT" HeaderText="Content" ControlStyle-Width="390px" ItemStyle-Width="490px" SortExpression="CONTENT"></asp:BoundField>
            <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="Instructor Id" SortExpression="INSTRUCTOR_ID"></asp:BoundField>

            <asp:BoundField DataField="QUESTION_ID" HeaderText="Question Id" SortExpression="QUESTION_ID"></asp:BoundField>
            <asp:BoundField DataField="DATE_CREATED" HeaderText="Created At" SortExpression="DATE_CREATED"></asp:BoundField>
            <asp:CommandField UpdateText="Save" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" ItemStyle-CssClass=" d-flex gap-2"></asp:CommandField>
            <asp:CommandField ControlStyle-CssClass="btn btn-danger" ShowDeleteButton="True"></asp:CommandField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="Reply" ConnectionString='<%$ ConnectionStrings:elearning %>' DeleteCommand='DELETE FROM "REPLY" WHERE "REPLY_ID" = :REPLY_ID' InsertCommand='INSERT INTO "REPLY" ("REPLY_ID", "CONTENT", "INSTRUCTOR_ID", "DATE_CREATED", "QUESTION_ID") VALUES (:REPLY_ID, :CONTENT, :INSTRUCTOR_ID, :DATE_CREATED, :QUESTION_ID)' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT * FROM "REPLY"' UpdateCommand='UPDATE "REPLY" SET "CONTENT" = :CONTENT, "INSTRUCTOR_ID" = :INSTRUCTOR_ID, "DATE_CREATED" = :DATE_CREATED, "QUESTION_ID" = :QUESTION_ID WHERE "REPLY_ID" = :REPLY_ID'>
        <DeleteParameters>
            <asp:Parameter Name="REPLY_ID" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="REPLY_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="CONTENT" Type="String"></asp:Parameter>
            <asp:Parameter Name="INSTRUCTOR_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="DATE_CREATED" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="QUESTION_ID" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CONTENT" Type="String"></asp:Parameter>
            <asp:Parameter Name="INSTRUCTOR_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="DATE_CREATED" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="QUESTION_ID" Type="String"></asp:Parameter>
            <asp:Parameter Name="REPLY_ID" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
