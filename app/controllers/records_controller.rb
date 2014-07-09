# The majority of The Supplejack Website code is Crown copyright (C) 2014, New Zealand Government,
# and is licensed under the GNU General Public License, version 3. Some components are 
# third party components that are licensed under the MIT license or other terms. 
# See https://github.com/DigitalNZ/supplejack_website for details. 
# 
# Supplejack was created by DigitalNZ at the National Library of NZ and the Department of Internal Affairs. 
# http://digitalnz.org/supplejack

class RecordsController < ApplicationController

  def home
    @search = search

    render :layout => "home"
  end

  def index
    @search = search(params.dup)
    SearchTab.add_type_facets(@search, params[:tab])
    @records = @search.results
    @facets = @search.facets
    @counts = tab_counts(params.dup)
  end

  def show
    @record = Record.find(params[:id], params[:search])
    @search = search(params[:search])
  end

  private

  def tab_counts(options={})
    options.delete(:tab)

    counts_search = Search.new(options)
    counts = Hash.new(0).merge(counts_search.types)    
  end
end
