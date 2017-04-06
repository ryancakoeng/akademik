<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MataKuliah.aspx.cs" Inherits="akademik_ccdp.MataKuliah" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h2>Mata Kuliah berdasarkan program</h2>
    <asp:EntityDataSource ID="EntityDataSourceProgram" runat="server" ContextTypeName="akademik_ccdp.DAL.akademik_dbEntities1" EnableFlattening="False" EntitySetName="programs" OnContextCreating="EntityDataSourceProgram_ContextCreating"></asp:EntityDataSource>
    <br/>
    Pilih Program :
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSourceProgram" DataTextField="kode_program" DataValueField="kode_program" AutoPostBack="True" Height="16px"></asp:DropDownList>

    <asp:EntityDataSource ID="EntityDataSourceMatakuliah" runat="server" ContextTypeName="akademik_ccdp.DAL.akademik_dbEntities1" EnableFlattening="False" EntitySetName="matakuliahs" OnContextCreating="EntityDataSourceMatakuliah_ContextCreating" AutoGenerateWhereClause="True" ConnectionString="name=akademik_dbEntities1" DefaultContainerName="akademik_dbEntities1" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="">
        <WhereParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="kode_program" PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:GridView ID="GridViewMatakuliah" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="kode_matakuliah" DataSourceID="EntityDataSourceMatakuliah">
        <Columns>
            <asp:CommandField ShowDeleteButton="True"
                ShowEditButton="True" />
            <asp:TemplateField HeaderText="Kode MataKuliah" SortExpression="kode_matakuliah">
                <EditItemTemplate>
                    <asp:DynamicControl ID="KodeMataKuliahTextBox" runat="server" DataField="kode_matakuliah" Mode="Edit" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DynamicControl ID="KodeMataKuliahLabel" runat="server" DataField="kode_matakuliah" Mode="ReadOnly" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kode Program" SortExpression="kode_program">
                <EditItemTemplate>
                    <asp:DynamicControl ID="KodeProgramTextBox" runat="server" DataField="kode_program" Mode="Edit"/>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DynamicControl ID="KodeProgramLabel" runat="server" DataField="kode_program" Mode="ReadOnly" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama MataKuliah" SortExpression="nama_matakuliah">
                <EditItemTemplate>
                    <asp:DynamicControl ID="NamaMataKuliahTextBox" runat="server" DataField="nama_matakuliah" Mode="Edit" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DynamicControl ID="NamaMataKuliahLabel" runat="server" DataField="nama_matakuliah" Mode="ReadOnly" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SKS" SortExpression="sks">
                <EditItemTemplate>
                    <asp:DynamicControl ID="SKSTextBox" runat="server" DataField="sks" Mode="Edit" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DynamicControl ID="SKSLabel" runat="server" DataField="sks" Mode="ReadOnly" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Semester" SortExpression="semester">
                <EditItemTemplate>
                    <asp:DynamicControl ID="SemesterTextBox" runat="server" DataField="semester" Mode="Edit" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DynamicControl ID="SemesterLabel" runat="server" DataField="semester" Mode="ReadOnly" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ValidationSummary ID="ValidationSummaryMataKuliah" runat="server" ShowSummary="true" DisplayMode="BulletList" Style="color: red"/>

    <h2>Pencarian Mata Kuliah</h2>
    Masukan Mata Kuliah
    <asp:TextBox ID="CariTextBox" runat="server"></asp:TextBox>
    <asp:Button ID="CariButton" runat="server" Text="Cari" />
    <asp:EntityDataSource ID="EntityDataSourceCari" runat="server" EntitySetName="matakuliahs" Include="program" ContextTypeName="akademik_ccdp.DAL.akademik_dbEntities1" OnContextCreating="EntityDataSourceCari_ContextCreating" ConnectionString="name=akademik_dbEntities1" DefaultContainerName="akademik_dbEntities1" EnableFlattening="False"></asp:EntityDataSource>
    <asp:QueryExtender ID="QueryExtenderCari" runat="server" TargetControlID="EntityDataSourceCari">
        <asp:SearchExpression SearchType="Startswith" DataFields="nama_matakuliah">
            <asp:ControlParameter ControlID="CariTextBox" />
        </asp:SearchExpression>
        <asp:OrderByExpression DataField="program.nama_program" Direction="Ascending">
            <asp:ThenBy DataField="nama_matakuliah" Direction="Ascending" />
        </asp:OrderByExpression>
    </asp:QueryExtender>
    <asp:GridView ID="GridViewCari" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="EntityDataSourceCari" DataKeyNames="kode_matakuliah">
        <Columns>
            <asp:BoundField DataField="kode_matakuliah" HeaderText="Kode Matakuliah" ReadOnly="True" SortExpression="kode_matakuliah" />
            <asp:BoundField DataField="nama_matakuliah" HeaderText="Nama Matakuliah" SortExpression="nama_matakuliah" />
            <asp:BoundField DataField="sks" HeaderText="sks" SortExpression="SKS" />
            <asp:BoundField DataField="semester" HeaderText="Semester" SortExpression="semester" />
        </Columns>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
