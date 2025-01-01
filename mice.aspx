<%@ Page Title="" Language="C#" MasterPageFile="/InnerMasterPage.Master" AutoEventWireup="true" CodeFile="mice.aspx.cs" Inherits="mice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
	<div class="container-fluid pl-0 pr-0 bg-white">
		<div class="row">
			<div class="mini-search-row">
				<div class="container">
					<div class="row">
						<div class="col-auto p-0">
							<img src="img/travel-icon.png" alt="">
						</div>
						<div class="col my-1">
							<label class="sr-only" for="txtFrom">From</label>
							<div class="input-group">
								<input type="text" class="form-control form-control-custom form-control-lg border-0 rounded-0" id="txtFrom" placeholder="Kolkata">
								<div class="input-group-prepend rounded-0 ">
									<div class="input-group-text border-0 bg-white">
										<i class="fas fa-map-marker-alt fa-lg text-black-50"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col my-1">
							<label class="sr-only" for="txtTo">To</label>
							<div class="input-group">
								<input type="text" class="form-control form-control-custom border-0 form-control-lg rounded-0" id="txtTo" placeholder="Bali">
								<div class="input-group-prepend rounded-0 ">
									<div class="input-group-text border-0 bg-white">
										<i class="fas fa-map-marker-alt fa-lg text-black-50"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col my-1">
							<label class="sr-only" for="txtDate">Date</label>
							<div class="input-group">
								<input type="date" class="form-control border-0 form-control-lg rounded-0 form-control-custom" id="txtDate">
								<div class="input-group-prepend  rounded-0 ">
									<div class="input-group-text border-0 bg-white">
										<i class="fas fa-calendar-alt fa-lg text-black-50"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col my-1">
							<button type="submit" class="btn btn-danger btn-block rounded-0 btn-lg">SEARCH</button>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="hotel_bread_crumbs"><ul><li class="pre_active"><a href="#" class="text-primary">Home</a></li><li class="active"><a href="#" class="text-primary">contact us</a></li></ul></div>
				</div>
				<div class="row">
					<div class="col-sm-3 heading">
						<h2 class="text-center">OUR SERVICES</h2>
					</div>
				</div>
				<div class="row">
					<div class="mice-body-area">
					<p class="mb-3">MICE’ is a growing buzzword that is dominating the field of tourism. The acronym ‘MICE’ stands for Meetings, Incentives, Conferences and Exhibitions. It is a concept that represents strategically organized programs that are based on any specific theme, viz., hobby, education or profession. It is a specific type of business tourism that relates to the endeavors or interests of groups of businessmen who want to travel for business purposes. The main objective of MICE is to cater to the different forms of international conferences, business meetings, exhibitions and events.
					</p>
					<p class="mb-3">In Zenith, we have taken up the challenging task of planning these tours for corporate focusing on their individualistic needs. We understand and analyze the purpose of their tour and then work out every intricate detail starting from pre departure parties to post departure arrangements. Our team remains with the group for the full duration of the tour.
					</p>
					<p class="mb-3">Our MICE Team proposes innovative ideas to help conduct these tours more cost effectively and efficiently from choosing star hotels close to the meeting venue, competitive airfares, cuisine best suited to the Indian palate and the best sightseeing programs. Our primary focus is to give the travelers their money’s worth so they remain our trusted clients. We ensure the best quality of service for these meetings, incentive programs, conferences and events across the world.
					</p>
					</div>
				</div>
				<section>
				<div class="row mt-5 ">
					<div class="col-sm-3 heading">
						<h2 class="text-center">OUR SERVICES</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-7">
					<div class="mice-body-area">
						<div class="">
						<p class="font-weight-bold">Some of the services provided for the MICE travels are : </p>
						<ul class="mice-ul">
							<li>Planning the travel.</li>
							<li>Familiarization visits before the tour.</li>
							<li>Choosing airline & booking air tickets, preparing Visas and other ticketing services.</li>
							<li>Accommodations in the best hotels.</li>
							<li>Sumptuous meals each day.</li>
							<li>Foreign exchange, transfers, insurance, phone cards.</li>
							<li>Technical support.</li>
							<li>Post event tours.</li>
						</ul>
						</div>
					</div>
					</div>
						<div class="col p-0">
							<div class="mice-service-slider">
								<div class="mice-body-area-extra">
								<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img class="d-block w-100" src="img/Gallery/1.jpg" alt="First slide">
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" src="img/Gallery/2.jpg" alt="Second slide">
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" src="img/Gallery/3.jpg" alt="Third slide">
										</div>
									</div>
									<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a>
									<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
							</div>
						</div>
						</div>
				</div>
					</section>
				<section>
					<div class="row mt-3 ">
						<div class="col-sm-4 heading">
							<h2 class="text-center">OUR DESTINATION</h2>
						</div>
					</div>
					<div  style="border: 1px solid #007db7">
					<div class="mice-destination-header text-center text-white">
						<h3>Thailand</h3>
					</div>
					<div class="row">
						<div class="col-7">
							<div class="mice-body-area">
								<div class="pl-3 pt-2">
									<p class="pb-3">Swasdi- welcome to ‘Krup Thep Maha Nako’ ……failed to comprehend! Dear friends we welcome you to the world’s one of the most visited country welcoming about 16 million international travelers every year-Thailand.
									</p>
									<p class="pb-3">Thailand is a beautiful and fascinating country with its breathtaking scenery and exotic beach resorts. But what makes it special is the Thai People; they are polite helpful and ever smiling race. Thus making it extremely desirable location for all kinds of travel- be it weddings, honeymoons or family travel. There is something for everyone-indulge in exotic foods, be amazed at the glorious temple, be pampered in luxurious spas, swim in crystal clear waters and lay on the deserted white beaches. Dance the night away and get a bargain shopping in one of the many markets & bazaars.
									</p>
									<p class="pb-3">Bangkok its capital can be considered an Asian super capital, a labyrinth and a traffic jam rolled into one, Bangkok is a mash of contemporary and traditional, the sacred and the profane.
									</p>
								</div>
							</div>
						</div>
						<div class="col pt-2 pr-4">
							<div class="mice-service-slider border-0">
								<div class="mice-body-area-extra ">
									<img src="img/Gallery/mice-thailand.jpg" alt="" class="w-100" style="height: 280px"/>
								</div>
							</div>
						</div>
					</div>
					</div>
				</section>
				<section>
					<div class="row mt-5 ">
						<div class="col-sm-4 heading">
							<h2 class="text-center">GUEST ENQUIRY</h2>
						</div>
					</div>
					<div class="p-4 mb-3" style="border: 1px solid #007db7">
						<div class="row mb-3">
							<div class="col">
								<div class="form-group">
									<label class="mice-form-lbl">Full Name</label>
									<input type="text" class="form-control mice-form-control">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label class="mice-form-lbl">Email</label>
									<input type="text" class="form-control mice-form-control">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label class="mice-form-lbl">Phone Number</label>
									<input type="text" class="form-control mice-form-control">
								</div>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col">
								<div class="form-group">
									<label class="mice-form-lbl">Type City</label>
									<input type="text" class="form-control mice-form-control">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label class="mice-form-lbl">Select Travel Date</label>
									<input type="text" class="form-control mice-form-control">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label class="mice-form-lbl">Details</label>
									<textarea class="form-control mice-form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
								</div>
								<button type="submit" class="btn btn-block btn-danger">SEND ENQUIRY</button>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</asp:Content>

