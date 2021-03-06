<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="Java" %>

<%@ include file="/common/taglib.jsp" %>

<jsp:useBean id="cs" class="com.ezcook.services.impls.FoodService" scope="request"
             type="com.ezcook.services.IFoodService"/>
<jsp:useBean id="food" class="com.ezcook.entities.Food" scope="request" type="com.ezcook.entities.Food"/>
<jsp:useBean id="foods" class="com.ezcook.daos.impls.FoodDao" type="com.ezcook.daos.impls.FoodDao"
             scope="application"></jsp:useBean>

<jsp:useBean id="foodType" class="com.ezcook.entities.FoodType" scope="request" type="com.ezcook.entities.FoodType"/>
<jsp:useBean id="foodTypes" class="com.ezcook.daos.impls.FoodTypeDao" type="com.ezcook.daos.impls.FoodTypeDao"
             scope="application"></jsp:useBean>

<header>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script>
        document.addEventListener("touchstart", function(){}, true);
    </script>
    <a href="<c:url value='#'/>" id="header-up" class="text-center rounded">
        <i class="fal fa-chevron-up text-white"></i>
    </a>
    <a id="close-sidebar-nav" class="header-1">
        <i class="fa fa-close"></i>
    </a>

    <c:set var="foodTypeList" value="${foodTypes.findAll()}" scope="application"></c:set>
    <!-- navigation control -->
    <nav id="navigation"
         class="header-layout-top menu-style-2 header-1 menu-item-padding penci-disable-sticky-nav">
        <div class="container">
            <div class="button-menu-mobile header-1"><i class="fa fa-bars"></i></div>
            <ul id="menu-main-menu-1" class="menu">
                <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-66 active">
                    <a href="<c:url value='/home'/>">Home</a>
                </li>
                <li class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-1209">
                    <a href="<c:url value="#"/>">C??ng Th???c<i class="fal fa-chevron-down"></i></a>
                    <ul class="sub-menu">
                        <li class="menu-item-0">
                            <div class="penci-megamenu">
                                <div class="penci-mega-child-categories">
                                    <c:forEach var="foodType" items="${foodTypeList}" varStatus="status">
                                        <a class="mega-cat-child"
                                           href="<c:url value='/category?id=${foodType.id}'/>"
                                           data-id="penci-mega-${foodType.id}"><span>${foodType.name}</span></a>
                                    </c:forEach>
                                </div>
                                <div class="penci-content-megamenu">
                                    <div class="penci-mega-latest-posts col-mn-4 mega-row-1">
                                        <c:forEach var="foodType" items="${foodTypeList}" varStatus="status">
                                            <div class="penci-mega-row penci-mega-${foodType.id}">
                                                <c:forEach var="food"
                                                           items="${foods.getListByFoodTypeIDAndLimit(foodType.id,4)}"
                                                           varStatus="status">
                                                    <div class="penci-mega-post">
                                                        <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="<c:url value='/category?id=${foodType.id}'/>">${foodType.name}</a>
                                                        </span>
                                                            <a class="penci-image-holder"
                                                               style="background-image: url('${food.image}')"
                                                               href="<c:url value='/blog?id=${food.id}'/>"
                                                               title="${food.name}">
                                                            </a>
                                                        </div>
                                                        <div class="penci-mega-meta">
                                                            <h3 class="post-mega-title">
                                                                <a href="<c:url value='/blog?id=${food.id}'/>"
                                                                   title="${food.name}">${food.name}&#8230;</a>
                                                            </h3>
                                                            <p class="penci-mega-date"><c:out
                                                                    value='${cs.formatTime(food.createdOn)}'/></p>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-245">
                    <a href="#">C???m h???ng s???ng<i class="fal fa-chevron-down"></i></a>
                    <ul class="sub-menu">
                        <li class="menu-item-0">
                            <div class="penci-megamenu">
                                <div class="penci-mega-child-categories">
                                    <a class="mega-cat-child"
                                       href="#"
                                       data-id="penci-mega-139"><span>Ca??m h????ng s????ng</span></a>
                                    <a class="mega-cat-child"
                                       href="#"
                                       data-id="penci-mega-17"><span>K?? ???c H?? N???i</span></a>
                                    <a class="mega-cat-child"
                                       href="#"
                                       data-id="penci-mega-201"><span>Nh???t k?? x??y m??</span></a>
                                </div>

                                <div class="penci-content-megamenu">
                                    <div class="penci-mega-latest-posts col-mn-4 mega-row-1">
                                        <div class="penci-mega-row penci-mega-139 row-active">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">C???m h???ng s???ng</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240620163_395383798623962_6691074099465274403_n.jpeg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="V??? ?????p c???a rau c???">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="V??? ?????p c???a rau c???">V??? ?????p c???a rau c???</a>
                                                    </h3>
                                                    <p class="penci-mega-date">September 7, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                C???m h???ng s???ng</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/189533859_10158451207468531_4963756709241630047_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="[Ghi l???i m???t m??a sen]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="[Ghi l???i m???t m??a sen]">[Ghi l???i m???t m??a sen]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 25, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                C???m h???ng s???ng</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240592596_10158698226213531_7156944578654639022_n.jpeg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="C??NG B??? K???T QU??? TH??? TH??CH TU???N ???CU???C PHI??U L??U 80 NG??Y ??N KH???P TH??? GI???I???">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="C??NG B??? K???T QU??? TH??? TH??CH TU???N ???CU???C PHI??U L??U 80 NG??Y ??N KH???P TH??? GI???I???">
                                                            C??NG B??? K???T QU??? TH??? TH??CH TU???N ???CU???C&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">September 15, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                C???m h???ng s???ng</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240592549_10158665120308531_1151239136467453639_n.jpeg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="???? TH??NG B??O SI??U HOT??????? M???i b???n tham gia Th??? th??ch tu???n ???CU???C PHI??U L??U 80 NG??Y ??N KH???P TH??? GI???I??? v?? kh??m ph?? ???kho b??u gi???i th?????ng ????? b???p???">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="???? TH??NG B??O SI??U HOT??????? M???i b???n tham gia Th??? th??ch tu???n ???CU???C PHI??U L??U 80 NG??Y ??N KH???P TH??? GI???I??? v?? kh??m ph?? ???kho b??u gi???i th?????ng ????? b???p???">????
                                                            TH??NG B??O SI??U HOT??????? M???i b???n tham&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">August 29, 2021</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="penci-mega-row penci-mega-17">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                K?? ???c H?? N???i</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/08/z2662804551637_523767798e4a3811e43f1a29e09ff7c4.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="[H?? N???i ??i ??n s??ng]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="[H?? N???i ??i ??n s??ng]">[H?? N???i ??i ??n s??ng]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">August 4, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                K?? ???c H?? N???i</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/189533859_10158451207468531_4963756709241630047_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="[Ghi l???i m???t m??a sen]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="[Ghi l???i m???t m??a sen]">[Ghi l???i m???t m??a sen]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 25, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                K?? ???c H?? N???i</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/186061311_4228730110504573_361081240528369684_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="[D??m ba th???c qu?? m??a h?? H?? N???i]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="[D??m ba th???c qu?? m??a h?? H?? N???i]">
                                                            [D??m ba th???c qu?? m??a h?? H?? N???i]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 23, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">K?? ???c H?? N???i</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/158622995_4014891761888410_427431966533677550_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="[K?? ???c H?? N???i] x [Th??ng Ba, hoa g???o]  TH??? L??M M??N &#8220;NHU??? HOA G???O X??O&#8221; TRONG TRUY???N THUY???T">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="[K?? ???c H?? N???i] x [Th??ng Ba, hoa g???o]  TH??? L??M M??N &#8220;NHU??? HOA G???O X??O&#8221; TRONG TRUY???N THUY???T">
                                                            [K?? ???c H?? N???i] x [Th??ng Ba, hoa&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">March 12, 2021</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="penci-mega-row penci-mega-201">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                Nh???t k?? x??y m??</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2020/09/50350387013_225b60accd_o.jpg?resize=477%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="B???P C???A NH???NG K??? M???NG M??">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="B???P C???A NH???NG K??? M???NG M??">B???P C???A NH???NG K??? M???NG M??</a>
                                                    </h3>
                                                    <p class="penci-mega-date">September 16, 2020</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                Nh???t k?? x??y m??</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2020/01/phan-anh-1.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="Qu?? t???ng gi??ng sinh">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="Qu?? t???ng gi??ng sinh">Qu?? t???ng gi??ng sinh</a>
                                                    </h3>
                                                    <p class="penci-mega-date">December 20, 2019</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                Nh???tk?? x??y m??</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2020/01/phan-anh-2.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="GIVEAWAY QU?? H???N &#038; R??? H???I S??N SALE">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="GIVEAWAY QU?? H???N &#038; R??? H???I S??N SALE">
                                                            GIVEAWAY QU?? H???N &#038; R??? H???I S??N SALE</a>
                                                    </h3>
                                                    <p class="penci-mega-date">December 5, 2019</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                Nh???t k?? x??y m??</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://www.esheepkitchen.com/wp-content/themes/soledad/images/no-image.jpg')"
                                                       href="#"
                                                       title="XIN CH??O SMEG">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="XIN CH??O SMEG">XIN CH??O SMEG</a>
                                                    </h3>
                                                    <p class="penci-mega-date">October 16, 2019</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </li>
                    </ul>
                </li>
                <li class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-940">
                    <a href="#">Travel<i
                            class="fal fa-chevron-down"></i></a>
                    <ul class="sub-menu">
                        <li class="menu-item-0">
                            <div class="penci-megamenu">
                                <div class="penci-content-megamenu">
                                    <div class="penci-mega-latest-posts col-mn-5 mega-row-1">
                                        <div class="penci-mega-row penci-mega-106 row-active">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                Travel </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/159892207_10158275163273531_4146992086500668909_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="[Y??u B???p: G??c ??i ch??i] T???NG NHAU M???T NG??Y-TR???NG-R???NG">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="[Y??u B???p: G??c ??i ch??i] T???NG NHAU M???T NG??Y-TR???NG-R???NG">
                                                            [Y??u B???p: G??c ??i ch??i] T???NG NHAU
                                                            M???T&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">March 13, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                Travel </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/03/117952152_3436659683044957_3070254024884009601_o.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="Chill out????">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="Chill out????">Chill out????</a>
                                                    </h3>
                                                    <p class="penci-mega-date">August 18, 2020</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">Travel </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2019/10/48895982903_7f081f00fa_k.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="C??CH T??? L??M B??NH ?????T L??NG G?? SI??U NGON">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="C??CH T??? L??M B??NH ?????T L??NG G?? SI??U NGON">
                                                            C??CH T??? L??M B??NH ?????T L??NG G?? SI??U&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">October 18, 2019</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">Travel </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2019/10/6.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="24H H?? H???N V???I M??A THU H?? N???I">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="24H H?? H???N V???I M??A THU H?? N???I">
                                                            24H H?? H???N V???I M??A THU H?? N???I</a>
                                                    </h3>
                                                    <p class="penci-mega-date">October 14, 2019</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">Travel </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2019/08/israel.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="Israel Culinary &#8211; X??? S??? DI???U K???">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="Israel Culinary &#8211; X??? S??? DI???U K???">
                                                            Israel Culinary &#8211; X??? S??? DI???U K???</a>
                                                    </h3>
                                                    <p class="penci-mega-date">July 5, 2019</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </li>
                    </ul>
                </li>
                <li class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-2860">
                    <a href="#">G??c Review<i
                            class="fal fa-chevron-down"></i></a>
                    <ul class="sub-menu">
                        <li class="menu-item-0">
                            <div class="penci-megamenu">
                                <div class="penci-content-megamenu">
                                    <div class="penci-mega-latest-posts col-mn-5 mega-row-1">
                                        <div class="penci-mega-row penci-mega-129 row-active">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                G??c Review </a>
                                                            <i class="fal fa-chevron-down"></i>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/08/51293429106_e35060dd48_k.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="#"
                                                       title="C??CH TR??NG TR???NG L???A C???C D??? &#038; M???O ???THU???N H??A??? CH???O CH???NG D??NH /K??m lu??n c??ch l??m c??m chi??n c?? ri b???c tr???ng ngon n???c n???/">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="#"
                                                           title="C??CH TR??NG TR???NG L???A C???C D??? &#038; M???O ???THU???N H??A??? CH???O CH???NG D??NH /K??m lu??n c??ch l??m c??m chi??n c?? ri b???c tr???ng ngon n???c n???/">
                                                            C??CH TR??NG TR???NG L???A C???C D???&#038; M???O&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">July 7, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                G??c Review
                                                            </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/178437315_10158387436163531_5990620767901999227_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="<c:url value='/#'/>"
                                                       title="[G??c review] ROBOT H??T B???I &#038; LAU NH?? 20 C??? C?? TH???C S??? TH???N TH??NH NH?? L???I ?????N? &#038; M???O S??? D???NG ROBOT B???N L??U">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="<c:url value='/#'/>"
                                                           title="[G??c review] ROBOT H??T B???I &#038; LAU NH?? 20 C??? C?? TH???C S??? TH???N TH??NH NH?? L???I ?????N? &#038; M???O S??? D???NG ROBOT B???N L??U">
                                                            [G??c review] ROBOT H??T B???I&#038; LAU NH??&#8230;
                                                        </a>
                                                    </h3>
                                                    <p class="penci-mega-date">April 28, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="<c:url value='/#'/>">
                                                                G??c Review
                                                            </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/51142169204_a8ea2a8ed5_b.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="<c:url value='/#'/>"
                                                       title="C??CH L??M CH??N GI?? H???M H??N QU???C SI??U B??? D?????NG C???C R???NH TAY B???NG N???I ??P SU???T ??A N??NG">
                                                        <i class="fa fa-play"></i>
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="<c:url value='/#'/>"
                                                           title="C??CH L??M CH??N GI?? H???M H??N QU???C SI??U B??? D?????NG C???C R???NH TAY B???NG N???I ??P SU???T ??A N??NG">
                                                            C??CH L??M CH??N GI?? H???M H??N QU???C SI??U&#8230;
                                                        </a>
                                                    </h3>
                                                    <p class="penci-mega-date">April 13, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="<c:url value='/#'/>">
                                                                G??c Review </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/my-lc-kk_51104342431_o.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="<c:url value='/#'/>"
                                                       title="[G??C S??? T???N TAY]  &#8211; T???T T???N T???T V??? EM M??Y L???C KH??NG KH?? TH??NG MINH C???A NH?? M??NH">
                                                        <i class="fa fa-play"></i>
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="<c:url value='/#'/>"
                                                           title="[G??C S??? T???N TAY]  &#8211; T???T T???N T???T V??? EM M??Y L???C KH??NG KH?? TH??NG MINH C???A NH?? M??NH">
                                                            [G??C S??? T???N TAY] &#8211; T???T T???N T???T&#8230;
                                                        </a>
                                                    </h3>
                                                    <p class="penci-mega-date">February 20, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="<c:url value='/#'/>">
                                                                G??c Review
                                                            </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/thumbnail-may-che-bien-tp-copy_51105453410_o-2.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="<c:url value='/#'/>"
                                                       title="[G??C REVIEW &#8211; S??? T???N TAY] L??M NEM 5 PH??T V???I M??Y CH??? BI???N TH???C PH???M ??A N??NG &#8211; TIN ???????C KH??NG? ???">
                                                        <i class="fa fa-play"></i>
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="<c:url value='/#'/>"
                                                           title="[G??C REVIEW &#8211; S??? T???N TAY] L??M NEM 5 PH??T V???I M??Y CH??? BI???N TH???C PH???M ??A N??NG &#8211; TIN ???????C KH??NG? ???">
                                                            [G??C REVIEW &#8211; S??? T???N TAY] L??M NEM&#8230;
                                                        </a>
                                                    </h3>
                                                    <p class="penci-mega-date">February 4, 2021</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-52">
                    <a href="#">About Ezcook</a>
                </li>

                <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-54">
                    <form class="search-container" action="<c:url value="/search"/>" method="GET" style="padding-top: 10px">
                        <input id="search-box" type="text" class="search-box" name="key" value="${key}" placeholder="T??m ki???m"  />
                        <label for="search-box"><span class="glyphicon glyphicon-search search-icon"></span></label>
                        <input type="submit" id="search-submit" />
                    </form>
                </li>
                <c:if test="${user == null}">
                    <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-53">
                        <a href="<c:url value='/login'/>">????ng nh???p</a>
                    </li>
                </c:if>
                <c:if test="${user != null}">
                    <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-53">
                        <a href="<c:url value='/login?action=logout'/>">Logout</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
    <!-- navigation control -->

    <!-- Toggle menu if size for mobile -->
    <nav id="sidebar-nav" class="header-1">

        <div id="sidebar-nav-logo">
            <a href="#">
                <img class="penci-lazy"
                     src="https://github.com/NachiLuong/ezcook-pgsql/blob/trung-admin/src/main/webapp/templates/admin/images/logo.jpg?raw=true"
                     data-src="https://github.com/NachiLuong/ezcook-pgsql/blob/trung-admin/src/main/webapp/templates/admin/images/logo.jpg?raw=true"
                     alt="Ezcook"/>
            </a>
        </div>

        <ul id="menu-main-menu" class="menu">
            <li id="menu-item-66"
                class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-66">
                <a href="<c:url value='/home'/>">Home</a>
            </li>
            <li id="menu-item-1209"
                class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-1209">
                <a href="<c:url value="#"/>">C??ng Th???c</a>
                <ul class="sub-menu">
                    <li id="menu-item-0" class="menu-item-0">
                        <div class="penci-megamenu">
                            <div class="penci-mega-child-categories">
                                <c:forEach var="foodType" items="${foodTypeList}" varStatus="status">
                                    <a class="mega-cat-child"
                                       href="<c:url value='/category?id=${foodType.id}'/>"
                                       data-id="penci-mega-${foodType.id}"><span>${foodType.name}</span></a>
                                </c:forEach>
                            </div>

                            <div class="penci-content-megamenu">
                                <div class="penci-mega-latest-posts col-mn-4 mega-row-1">
                                    <c:forEach var="foodType" items="${foodTypeList}" varStatus="status">
                                        <div class="penci-mega-row penci-mega-${foodType.id}">
                                            <c:forEach var="food"
                                                       items="${foods.getListByFoodTypeIDAndLimit(foodType.id,4)}"
                                                       varStatus="status">
                                                <div class="penci-mega-post">
                                                    <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="<c:url value='/category?id=${foodType.id}'/>">${foodType.name}</a>
                                                        </span>
                                                        <a class="penci-image-holder"
                                                           style="background-image: url('${food.image}')"
                                                           href="<c:url value='/blog?id=${food.id}'/>"
                                                           title="${food.name}">
                                                        </a>
                                                    </div>
                                                    <div class="penci-mega-meta">
                                                        <h3 class="post-mega-title">
                                                            <a href="<c:url value='/blog?id=${food.id}'/>"
                                                               title="${food.name}">${food.name}&#8230;</a>
                                                        </h3>
                                                        <p class="penci-mega-date"><c:out
                                                                value='${cs.formatTime(food.createdOn)}'/></p>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                        </div>
                    </li>
                </ul>
            </li>
            <li id="menu-item-245"
                class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-245">
                <a href="#">C???m h???ng s???ng<i class="fal fa-chevron-down"></i></a>
                <ul class="sub-menu">
                    <li class="menu-item-0">
                        <div class="penci-megamenu">
                            <div class="penci-mega-child-categories">
                                <a class="mega-cat-child"
                                   href="#"
                                   data-id="penci-mega-139"><span>Ca??m h????ng s????ng</span></a>
                                <a class="mega-cat-child"
                                   href="#"
                                   data-id="penci-mega-17"><span>K?? ???c H?? N???i</span></a>
                                <a class="mega-cat-child"
                                   href="#"
                                   data-id="penci-mega-201"><span>Nh???t k?? x??y m??</span></a>
                            </div>

                            <div class="penci-content-megamenu">
                                <div class="penci-mega-latest-posts col-mn-4 mega-row-1">
                                    <div class="penci-mega-row penci-mega-139 row-active">
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">C???m h???ng s???ng</a> </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240620163_395383798623962_6691074099465274403_n.jpeg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="V??? ?????p c???a rau c???">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="V??? ?????p c???a rau c???">V??? ?????p c???a rau c???</a>
                                                </h3>
                                                <p class="penci-mega-date">September 7, 2021</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                C???m h???ng s???ng</a> </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/189533859_10158451207468531_4963756709241630047_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="[Ghi l???i m???t m??a sen]">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="[Ghi l???i m???t m??a sen]">[Ghi l???i m???t m??a sen]</a>
                                                </h3>
                                                <p class="penci-mega-date">May 25, 2021</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                C???m h???ng s???ng</a> </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240592596_10158698226213531_7156944578654639022_n.jpeg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="C??NG B??? K???T QU??? TH??? TH??CH TU???N ???CU???C PHI??U L??U 80 NG??Y ??N KH???P TH??? GI???I???">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="C??NG B??? K???T QU??? TH??? TH??CH TU???N ???CU???C PHI??U L??U 80 NG??Y ??N KH???P TH??? GI???I???">
                                                        C??NG B??? K???T QU??? TH??? TH??CH TU???N ???CU???C&#8230;</a>
                                                </h3>
                                                <p class="penci-mega-date">September 15, 2021</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                C???m h???ng s???ng</a> </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240592549_10158665120308531_1151239136467453639_n.jpeg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="???? TH??NG B??O SI??U HOT??????? M???i b???n tham gia Th??? th??ch tu???n ???CU???C PHI??U L??U 80 NG??Y ??N KH???P TH??? GI???I??? v?? kh??m ph?? ???kho b??u gi???i th?????ng ????? b???p???">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="???? TH??NG B??O SI??U HOT??????? M???i b???n tham gia Th??? th??ch tu???n ???CU???C PHI??U L??U 80 NG??Y ??N KH???P TH??? GI???I??? v?? kh??m ph?? ???kho b??u gi???i th?????ng ????? b???p???">????
                                                        TH??NG B??O SI??U HOT??????? M???i b???n tham&#8230;</a>
                                                </h3>
                                                <p class="penci-mega-date">August 29, 2021</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="penci-mega-row penci-mega-17">
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                K?? ???c H?? N???i</a> </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/08/z2662804551637_523767798e4a3811e43f1a29e09ff7c4.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="[H?? N???i ??i ??n s??ng]">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="[H?? N???i ??i ??n s??ng]">[H?? N???i ??i ??n s??ng]</a>
                                                </h3>
                                                <p class="penci-mega-date">August 4, 2021</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                K?? ???c H?? N???i</a> </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/189533859_10158451207468531_4963756709241630047_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="[Ghi l???i m???t m??a sen]">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="[Ghi l???i m???t m??a sen]">[Ghi l???i m???t m??a sen]</a>
                                                </h3>
                                                <p class="penci-mega-date">May 25, 2021</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                K?? ???c H?? N???i</a> </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/186061311_4228730110504573_361081240528369684_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="[D??m ba th???c qu?? m??a h?? H?? N???i]">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="[D??m ba th???c qu?? m??a h?? H?? N???i]">
                                                        [D??m ba th???c qu?? m??a h?? H?? N???i]</a>
                                                </h3>
                                                <p class="penci-mega-date">May 23, 2021</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">K?? ???c H?? N???i</a> </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/158622995_4014891761888410_427431966533677550_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="[K?? ???c H?? N???i] x [Th??ng Ba, hoa g???o]  TH??? L??M M??N &#8220;NHU??? HOA G???O X??O&#8221; TRONG TRUY???N THUY???T">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="[K?? ???c H?? N???i] x [Th??ng Ba, hoa g???o]  TH??? L??M M??N &#8220;NHU??? HOA G???O X??O&#8221; TRONG TRUY???N THUY???T">
                                                        [K?? ???c H?? N???i] x [Th??ng Ba, hoa&#8230;</a>
                                                </h3>
                                                <p class="penci-mega-date">March 12, 2021</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="penci-mega-row penci-mega-201">
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                Nh???t k?? x??y m??</a> </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2020/09/50350387013_225b60accd_o.jpg?resize=477%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="B???P C???A NH???NG K??? M???NG M??">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="B???P C???A NH???NG K??? M???NG M??">B???P C???A NH???NG K??? M???NG M??</a>
                                                </h3>
                                                <p class="penci-mega-date">September 16, 2020</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                Nh???t k?? x??y m??</a> </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2020/01/phan-anh-1.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="Qu?? t???ng gi??ng sinh">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="Qu?? t???ng gi??ng sinh">Qu?? t???ng gi??ng sinh</a>
                                                </h3>
                                                <p class="penci-mega-date">December 20, 2019</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                Nh???tk?? x??y m??</a> </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2020/01/phan-anh-2.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="GIVEAWAY QU?? H???N &#038; R??? H???I S??N SALE">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="GIVEAWAY QU?? H???N &#038; R??? H???I S??N SALE">
                                                        GIVEAWAY QU?? H???N &#038; R??? H???I S??N SALE</a>
                                                </h3>
                                                <p class="penci-mega-date">December 5, 2019</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                Nh???t k?? x??y m??</a> </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://www.esheepkitchen.com/wp-content/themes/soledad/images/no-image.jpg')"
                                                   href="#"
                                                   title="XIN CH??O SMEG">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="XIN CH??O SMEG">XIN CH??O SMEG</a>
                                                </h3>
                                                <p class="penci-mega-date">October 16, 2019</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </li>
                </ul>
            </li>
            <li id="menu-item-940"
                class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-940">
                <a href="#">Travel<i
                        class="fal fa-chevron-down"></i></a>
                <ul class="sub-menu">
                    <li class="menu-item-0">
                        <div class="penci-megamenu">
                            <div class="penci-content-megamenu">
                                <div class="penci-mega-latest-posts col-mn-5 mega-row-1">
                                    <div class="penci-mega-row penci-mega-106 row-active">
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                Travel </a>
                                                        </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/159892207_10158275163273531_4146992086500668909_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="[Y??u B???p: G??c ??i ch??i] T???NG NHAU M???T NG??Y-TR???NG-R???NG">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="[Y??u B???p: G??c ??i ch??i] T???NG NHAU M???T NG??Y-TR???NG-R???NG">
                                                        [Y??u B???p: G??c ??i ch??i] T???NG NHAU
                                                        M???T&#8230;</a>
                                                </h3>
                                                <p class="penci-mega-date">March 13, 2021</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                Travel </a>
                                                        </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/03/117952152_3436659683044957_3070254024884009601_o.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="Chill out????">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="Chill out????">Chill out????</a>
                                                </h3>
                                                <p class="penci-mega-date">August 18, 2020</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">Travel </a>
                                                        </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2019/10/48895982903_7f081f00fa_k.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="C??CH T??? L??M B??NH ?????T L??NG G?? SI??U NGON">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="C??CH T??? L??M B??NH ?????T L??NG G?? SI??U NGON">
                                                        C??CH T??? L??M B??NH ?????T L??NG G?? SI??U&#8230;</a>
                                                </h3>
                                                <p class="penci-mega-date">October 18, 2019</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">Travel </a>
                                                        </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2019/10/6.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="24H H?? H???N V???I M??A THU H?? N???I">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="24H H?? H???N V???I M??A THU H?? N???I">
                                                        24H H?? H???N V???I M??A THU H?? N???I</a>
                                                </h3>
                                                <p class="penci-mega-date">October 14, 2019</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">Travel </a>
                                                        </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2019/08/israel.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="Israel Culinary &#8211; X??? S??? DI???U K???">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="Israel Culinary &#8211; X??? S??? DI???U K???">
                                                        Israel Culinary &#8211; X??? S??? DI???U K???</a>
                                                </h3>
                                                <p class="penci-mega-date">July 5, 2019</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </li>
                </ul>
            </li>
            <li id="menu-item-2860"
                class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-2860">
                <a href="#">G??c Review<i
                        class="fal fa-chevron-down"></i></a>
                <ul class="sub-menu">
                    <li class="menu-item-0">
                        <div class="penci-megamenu">
                            <div class="penci-content-megamenu">
                                <div class="penci-mega-latest-posts col-mn-5 mega-row-1">
                                    <div class="penci-mega-row penci-mega-129 row-active">
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                G??c Review </a>
                                                            <i class="fal fa-chevron-down"></i>
                                                        </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/08/51293429106_e35060dd48_k.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="#"
                                                   title="C??CH TR??NG TR???NG L???A C???C D??? &#038; M???O ???THU???N H??A??? CH???O CH???NG D??NH /K??m lu??n c??ch l??m c??m chi??n c?? ri b???c tr???ng ngon n???c n???/">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="#"
                                                       title="C??CH TR??NG TR???NG L???A C???C D??? &#038; M???O ???THU???N H??A??? CH???O CH???NG D??NH /K??m lu??n c??ch l??m c??m chi??n c?? ri b???c tr???ng ngon n???c n???/">
                                                        C??CH TR??NG TR???NG L???A C???C D???&#038; M???O&#8230;</a>
                                                </h3>
                                                <p class="penci-mega-date">July 7, 2021</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="#">
                                                                G??c Review
                                                            </a>
                                                        </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/178437315_10158387436163531_5990620767901999227_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="<c:url value='/#'/>"
                                                   title="[G??c review] ROBOT H??T B???I &#038; LAU NH?? 20 C??? C?? TH???C S??? TH???N TH??NH NH?? L???I ?????N? &#038; M???O S??? D???NG ROBOT B???N L??U">
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="<c:url value='/#'/>"
                                                       title="[G??c review] ROBOT H??T B???I &#038; LAU NH?? 20 C??? C?? TH???C S??? TH???N TH??NH NH?? L???I ?????N? &#038; M???O S??? D???NG ROBOT B???N L??U">
                                                        [G??c review] ROBOT H??T B???I&#038; LAU NH??&#8230;
                                                    </a>
                                                </h3>
                                                <p class="penci-mega-date">April 28, 2021</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="<c:url value='/#'/>">
                                                                G??c Review
                                                            </a>
                                                        </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/51142169204_a8ea2a8ed5_b.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="<c:url value='/#'/>"
                                                   title="C??CH L??M CH??N GI?? H???M H??N QU???C SI??U B??? D?????NG C???C R???NH TAY B???NG N???I ??P SU???T ??A N??NG">
                                                    <i class="fa fa-play"></i>
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="<c:url value='/#'/>"
                                                       title="C??CH L??M CH??N GI?? H???M H??N QU???C SI??U B??? D?????NG C???C R???NH TAY B???NG N???I ??P SU???T ??A N??NG">
                                                        C??CH L??M CH??N GI?? H???M H??N QU???C SI??U&#8230;
                                                    </a>
                                                </h3>
                                                <p class="penci-mega-date">April 13, 2021</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="<c:url value='/#'/>">
                                                                G??c Review </a>
                                                        </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/my-lc-kk_51104342431_o.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="<c:url value='/#'/>"
                                                   title="[G??C S??? T???N TAY]  &#8211; T???T T???N T???T V??? EM M??Y L???C KH??NG KH?? TH??NG MINH C???A NH?? M??NH">
                                                    <i class="fa fa-play"></i>
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="<c:url value='/#'/>"
                                                       title="[G??C S??? T???N TAY]  &#8211; T???T T???N T???T V??? EM M??Y L???C KH??NG KH?? TH??NG MINH C???A NH?? M??NH">
                                                        [G??C S??? T???N TAY] &#8211; T???T T???N T???T&#8230;
                                                    </a>
                                                </h3>
                                                <p class="penci-mega-date">February 20, 2021</p>
                                            </div>
                                        </div>
                                        <div class="penci-mega-post">
                                            <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="<c:url value='/#'/>">
                                                                G??c Review
                                                            </a>
                                                        </span>
                                                <a class="penci-image-holder"
                                                   style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/thumbnail-may-che-bien-tp-copy_51105453410_o-2.jpg?resize=585%2C390&amp;ssl=1')"
                                                   href="<c:url value='/#'/>"
                                                   title="[G??C REVIEW &#8211; S??? T???N TAY] L??M NEM 5 PH??T V???I M??Y CH??? BI???N TH???C PH???M ??A N??NG &#8211; TIN ???????C KH??NG? ???">
                                                    <i class="fa fa-play"></i>
                                                </a>
                                            </div>
                                            <div class="penci-mega-meta">
                                                <h3 class="post-mega-title">
                                                    <a href="<c:url value='/#'/>"
                                                       title="[G??C REVIEW &#8211; S??? T???N TAY] L??M NEM 5 PH??T V???I M??Y CH??? BI???N TH???C PH???M ??A N??NG &#8211; TIN ???????C KH??NG? ???">
                                                        [G??C REVIEW &#8211; S??? T???N TAY] L??M NEM&#8230;
                                                    </a>
                                                </h3>
                                                <p class="penci-mega-date">February 4, 2021</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </li>
            <li id="menu-item-51" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-51">
                <a href="#">About Ezcook</a>
            <li id="menu-item-52" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-52">
            <c:if test="${user == null}">
            <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-53">
                <a href="<c:url value='/login'/>">????ng nh???p</a>
            </li>
            </c:if>
            <c:if test="${user != null}">
                <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-53">
                    <a href="<c:url value='/login?action=logout'/>">Logout</a>
                </li>
            </c:if>
        </ul>
    </nav>
    <!-- Toggle menu if size for mobile -->
</header>
