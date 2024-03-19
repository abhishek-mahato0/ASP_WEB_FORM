<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="ClassroomCoursework.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  
    <div class=" w-100 h-100 d-flex flex-column gap-2 justify-content-end">
        <div class="mt-3 w-100 align-items-center justify-content-center align-content-center">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID" DataSourceID="CoursesList">
          
                <InsertItemTemplate>
                    <div class="w-100" style="z-index: 9999;">
                        <div class="d-flex flex-column gap-2 border-2 rounded-4 bg-light px-3 py-4 shadow-lg"
                            style="width:450px; position: absolute; top: 50px; right: 430px; z-index: 99;">
                            <h2 class=" fs-4 mb-1 px-3 text-primary">Add New Course</h2>
                            <div class="row px-3">
                                <label class="form-label">COURSE ID</label>
                                <asp:TextBox Text='<%# Bind("COURSE_ID") %>' CssClass="form-control" runat="server" ID="COURSE_IDTextBox" /><br />
                            </div>
                            <div class="row px-3">
                            <label class=" form-label ">COURSE TITLE</label>
                           <asp:TextBox Text='<%# Bind("COURSE_TITLE") %>' runat="server"  CssClass="form-control" ID="COURSE_TITLETextBox" /><br />
                            </div>
                            <div class="row px-3">
                            <label class=" form-label ">RELEASE DATE</label>
                            <asp:TextBox Text='<%# Bind("RELASE_DATE") %>' TextMode="Date" runat="server"  CssClass="form-control" ID="RELASE_DATETextBox" /><br />
                             </div>
                            <div class="row px-3">
                             <label class=" form-label ">Duration <span>(in hrs)</span></label>
                             <asp:TextBox Text='<%# Bind("DURATION") %>' runat="server"  CssClass="form-control" ID="DURATIONTextBox" /><br />
                            </div>

                            <div class="row px-3">
                                <label class=" form-label ">PRICE <span>(in $)</span></label>
                                <asp:TextBox Text='<%# Bind("PRICE") %>' runat="server" CssClass="form-control" ID="TextBox1" /><br />
                            </div>

                            <div class=" w-100 d-flex align-items-center justify-content-end gap-3 mt-3">
                            <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-outline-danger" ID="InsertCancelButton" CausesValidation="False" />
                            <asp:LinkButton runat="server" Text="Save" CssClass="btn btn-primary" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                            </div>
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                      <div class=" fs-4 fw-bolder text-primary">Courses Information</div>
                    <div class=" w-auto d-flex justify-content-end align-items-center position-absolute" style=" top:76px; right:36px;" >
                        <asp:LinkButton runat="server" CssClass="btn btn-primary px-4" Text="Add New Course" CommandName="New" ID="NewButton" CausesValidation="False" />
                    </div>
                </ItemTemplate>
                  
            </asp:FormView>
        </div>

      <%--  <asp:Button Text="Add Course" CssClass="btn btn-primary mb-4" OnClick="changetopath" runat="server" />--%>
        <div class="w-100 mx-3">
            <asp:GridView ID="GridView1" CssClass="w-100 mt-3" AlternatingRowStyle-BackColor="#FAFAFA" RowStyle-CssClass=" border-bottom" HeaderStyle-Font-Size="Larger" HeaderStyle-BackColor="#1b6ee2" HeaderStyle-ForeColor="White" BorderStyle="Groove" CellPadding="7" GridLines="Horizontal" PagerStyle-BorderWidth="4" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID" DataSourceID="CoursesList">
            
                <Columns>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="Course Id" ReadOnly="True" SortExpression="COURSE_ID"></asp:BoundField>
                    <asp:BoundField DataField="COURSE_TITLE" HeaderText="Course Title" SortExpression="COURSE_TITLE"></asp:BoundField>
                    <asp:BoundField DataField="RELASE_DATE" HeaderText="Release Date" SortExpression="RELASE_DATE"></asp:BoundField>
                    <asp:BoundField DataField="DURATION" HeaderText="Duration" SortExpression="DURATION"></asp:BoundField>
                    <asp:BoundField DataField="PRICE" HeaderText="Price($)" SortExpression="PRICE"></asp:BoundField>
                    <asp:CommandField UpdateText="Save" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" ItemStyle-CssClass=" d-flex gap-2"></asp:CommandField>
                     <asp:CommandField ControlStyle-CssClass="btn btn-danger" ShowDeleteButton="True"></asp:CommandField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="CoursesList" ConnectionString='<%$ ConnectionStrings:elearning %>' DeleteCommand='DELETE FROM "COURSE" WHERE "COURSE_ID" = :COURSE_ID' InsertCommand='INSERT INTO "COURSE" ("COURSE_ID", "COURSE_TITLE", "RELASE_DATE", "DURATION", "PRICE") VALUES (:COURSE_ID, :COURSE_TITLE, :RELASE_DATE, :DURATION, :PRICE)' ProviderName='<%$ ConnectionStrings:elearning.ProviderName %>' SelectCommand='SELECT * FROM "COURSE"' UpdateCommand='UPDATE "COURSE" SET "COURSE_TITLE" = :COURSE_TITLE, "RELASE_DATE" = :RELASE_DATE, "DURATION" = :DURATION, "PRICE"=:PRICE WHERE "COURSE_ID" = :COURSE_ID'>
                <DeleteParameters>
                    <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="COURSE_TITLE" Type="String"></asp:Parameter>
                    <asp:Parameter Name="RELASE_DATE" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="DURATION" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="PRICE" Type="Decimal"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="COURSE_TITLE" Type="String"></asp:Parameter>
                    <asp:Parameter Name="RELASE_DATE" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="DURATION" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="PRICE" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand='DELETE FROM "COURSE" WHERE "COURSE_ID" = :COURSE_ID' InsertCommand='INSERT INTO "COURSE" ("COURSE_ID", "COURSE_TITLE") VALUES (:COURSE_ID, :COURSE_TITLE)' ProviderName='<%$ ConnectionStrings:ConnectionString.ProviderName %>' SelectCommand='SELECT "COURSE_ID", "COURSE_TITLE" FROM "COURSE"' UpdateCommand='UPDATE "COURSE" SET "COURSE_TITLE" = :COURSE_TITLE WHERE "COURSE_ID" = :COURSE_ID'>
                <DeleteParameters>
                    <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="COURSE_TITLE" Type="String"></asp:Parameter>
                </InsertParameters>
                     <UpdateParameters>
                 <asp:Parameter Name="COURSE_TITLE" Type="String"></asp:Parameter>
                  <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
               </UpdateParameters>
               
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
