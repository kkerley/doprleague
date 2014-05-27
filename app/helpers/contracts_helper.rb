module ContractsHelper
    def all_contracts
        @contracts = Contract.all
    end

	def buyouts_contracts
		@contracts = Contract.where('is_bought_out = ?', true).page(params[:page]).per_page(40).includes(:subcontracts)
	end

	def extensions_contracts
    	@contracts = Contract.where('is_extended = ?', true).where('is_franchised != ?', true).where('is_bought_out != ?', true)
    end

    def franchises_contracts
    	@contracts = Contract.where('is_franchised = ?', true).where('is_extended != ?', true).where('is_bought_out != ?', true)
    end

    def both_contracts
    	@contracts = Contract.where('is_extended = ?', true).where('is_franchised = ?', true ).where('is_bought_out != ?', true)
    end
end
