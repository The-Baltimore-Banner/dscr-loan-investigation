# dscr-loan-investigation

### by [Sahana Jayaraman](mailto:sahana.jayaraman@thebanner.com)

-   [Overview](#overview)
-   [Data](#data)
-   [Methodology](#method)
-   [Limitations](#limitations)
-   [License](#license)

<a id="overview"></a>

## Overview {#overview}

In concentrated pockets of east and west Baltimore, dozens of homes received foreclosure notices and hit the auction block this spring at noticeably inflated prices. Nobody is buying them.

They're part of a portfolio of more than 700 homes purchased by a small group of investors based in Spring Valley, New York, using a newly popular and poorly-regulated loan product called a debt-service coverage ratio, or DSCR, loan.

At least five Wall Street-backed financiers “blacklisted” the buyers, as well as some of their associates and affiliated entities — and clamped down on lending in Baltimore starting this June.

But by then the New York buyers had amassed some \$90 million worth of loans from dozens of private lenders, including AmeriTrust Mortgage Corp. and RCN Capital, according to public land records. At least half of the Baltimore properties in the New Yorkers’ portfolio are in or nearing foreclosure.

So many defaults could send neighborhoods spiraling and untether the families living in them. And it has the potential to make Baltimore a ground zero for America’s next great foreclosure crisis, dooming the [effort to clear the city’s stock of vacant homes](https://www.thebanner.com/community/housing/wes-moore-baltimore-vacants-KK5KD2EY65G4XB447QJB3WFHD4/) and [scaring off more investment](https://www.thebanner.com/community/housing/baltimore-vacant-home-fund-3RDGKWYWFJAJVDAFCYEWVJJ6JQ/) at a time it’s sorely needed.

[Read the story here]().

<a id="data"></a>

## Data {#data}

[Download the data folder for this project here](). Make sure that you put it in the root directory of this repo. This folder contains many of the pieces that you'll need to recreate the analysis from scratch, as well as the results from our work. You'll need to allocate about 50 GB of hard drive space for this folder.

<a id="method"></a>

## Methodology

## How we identified the New York portfolio of properties  

After receiving a tip about foreclosures linked to two New York-based LLCs that had declared bankruptcy, we used records from those bankruptcies alongside land records, business filings and data from Open Corporates to compile a list of LLCs affiliated with Benjamin Eidlisz, Eluzer Gold and their associates. 

We filtered the [real property data publicly available on Open Baltimore](https://data.baltimorecity.gov/datasets/64110b108565433d8da40dd0e422064e_0/explore) to find all of the properties owned by any of these LLCs. 

### How we counted DSCR Loans

We started with every loan reported in publicly-available HMDA data for every year 2018 through 2024, narrowing down to our universe of loans by selecting only:

-   "Originated" loans, or loans approved by the lender and accepted by the borrower.

-   First liens

-   Loans secured by one-to-four unit rental properties

-   Loans with a closed line of credit; that is, real estate loans that award borrowers a lump sum of money to be paid back in installments over a set period of time.

Aided by mortgage originators and experts — particularly Vadim Elenev, associate professor at the Johns Hopkins Carey Business School — we developed criteria to identify DSCR loans within this universe.

Our analysis selects only loans for which neither the debt-to-income ratio nor the personal income figures of the borrower were reported. This is the most important filter we implement, and we do so because lenders don't rely upon a borrower's income to extend them a DSCR loan.

Additionally, we selected only for loans that have 30 to 40 year terms, are marked business-purpose and haven't been purchased by a government-sponsored enterprise, like Fannie Mae or Freddie Mac.

<a id="limitations"></a>

## Limitations 

### DSCR Loan definition

There is no clear-cut way to separate DSCR loans from other types of loans included in the HMDA data. While the criteria detailed above represents our research-based approach to identifying this type of loan, it should be understood that our analysis may exclude some DSCR loans that don't match our criteria, or include other types of loans that do.

<a id="license"></a>

## License {#license}

Copyright 2025, The Venetoulis Institute for Local Journalism

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1.  Redistributions of source code must retain the above copyright notice, this list of conditions, and the following disclaimer.
2.  Redistributions in binary form must reproduce the above copyright notice, this list of conditions, and the following disclaimer in the documentation and/or other materials provided with the distribution.
3.  Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
