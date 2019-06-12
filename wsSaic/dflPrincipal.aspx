<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipal.master" AutoEventWireup="true" CodeFile="dflPrincipal.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="camera_container">
        <div style="position: relative; display: inline-block; text-align: center;">
            <img src="images/page-1_slide01.jpg" />
            
            <div style=" position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 90%">
                <h1 style="color: #57aacd; font-weight: 500; font-size:45px">Las mejores soluciones de copiado para tu negocio</h1>
            </div>
        </div>
    </section>

    <section>
        <div class="container banner_wr">
            <ul class="banner">
                <li>
                    <div class="fa-globe"></div>
                    <h3>Global<br />
                        research</h3>
                    <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
                    <a href="#"></a>
                </li>
                <li>
                    <div class="fa-lightbulb-o"></div>
                    <h3>Creative<br />
                        ideas</h3>
                    <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
                    <a href="#"></a>
                </li>
                <li>
                    <div class="fa-cog"></div>
                    <h3>New<br />
                        services</h3>
                    <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
                    <a href="#"></a>
                </li>
                <li>
                    <div class="fa-briefcase"></div>
                    <h3>Pro<br />
                        management</h3>
                    <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
                    <a href="#"></a>
                </li>
            </ul>
        </div>
    </section>

</asp:Content>

