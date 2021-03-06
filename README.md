# Hotels data merge
>
  In any hotels site like Kaligo.com operated by Ascenda, there's a lot of effort being made to present
  content in a clean & organised manner. Underneath the hood however, the data procurement process is
  complex and data is often mismatched & dirty. The task is to write a simplified version of our data
  procurement & merging proceess.


## Table of contents
* [Technologies](#technologies)
* [Features](#features)
* [MiniTest](#minitest)
* [Status](#status)
* [Contact](#contact)

## Technologies
* Ruby - version 2.3.1
* Rails - version 5.2.3

## Features
List of features

* Get a list of hotels: As an user, I want to get a list of hotels

```html
  https://hotels-sg-data-ascenda.herokuapp.com/hotels
```

* Get a list of hotels by hotel ids and destiation id: As an user, I want to filter a
  list of hotels in either option:

```html
  - hotels: based on a list of hotel IDs given
  - destination: based on a given destination ID

  https://hotels-sg-data-ascenda.herokuapp.com/hotels?hotel_ids=iJhz,SjyX?dest_id=5432
```

## MiniTest

* Run a test

```html
 rails test -v
```

## Status
Project is: _finished_

## Contact
Created by [@Nguyen Ngoc Hai](https://github.com/hoasung01/SharingKnowledge/blob/master/Interview/CV/Assets/NguyenNgocHai_CV.pdf) - feel free to contact me!