import React, { Component } from 'react';

class About extends Component{
    render() {

        return (
        <section class="py-5">
                <div class="container text-primary">
                    <h1 class="text-center">About Know Your Neighborhood</h1>
                    <div class="row mb-5">
                        <div class="col-2">
                        </div>
                        <div class="col-8 text-center">
                        <p class="lead">
                        At Know Your Neighborhood, we believe that understanding and connecting with your
                        local community is essential for creating a vibrant and harmonious living environment. Our
                        mission is to provide you with the tools and information you need to explore, engage, and make
                        the most of your neighborhood.
                        </p>
                        </div>
                        <div class="col-2">
                        </div>

                    </div>

                   



            <div class="row fs-5">
                <div class="col-md-6">
                   
                            <p>
                                We understand that each neighborhood has its unique charm, character, and challenges. Our
                                platform is designed to empower you with local insights, interesting facts, and valuable
                                resources to help you navigate and appreciate your neighborhood's distinctive features.
                            </p>
                            <p>
                                Whether you're a long-time resident or new to the area, Know Your Neighborhood offers a comprehensive
                                range of services. From exploring local landmarks and attractions to discovering hidden gems, we
                                strive to be your go-to resource for all things neighborhood-related.
                            </p>
                            <p>Join our community of neighborhood enthusiasts, and together let's uncover the stories, connect with neighbors,
                                and foster a stronger sense of belonging. We encourage you to dive in, contribute your knowledge, and be an
                                active participant in shaping a vibrant community.
                            </p>
                </div>
                <div class="col-md-6">
                    <img src="./assets/images/neigh.jpg" alt="A bunch of stores" class="img-fluid"/>
                </div>
                </div>
                    <p class="lead text-center mt-5">Know Your Neighborhood—unlock the true potential of your local community!</p>
            </div>
        </section>
        )
    }

}

export default About