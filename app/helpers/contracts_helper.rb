module ContractsHelper
    def all_contracts
        @contracts = Contract.all
    end

	def buyouts_contracts
		@contracts = Contract.where('is_bought_out = ?', true).includes(:subcontracts).page params[:page]
	end

	def extensions_contracts
    	@contracts = Contract.where('is_extended = ?', true).where('is_franchised != ?', true).where('is_bought_out != ?', true).includes(:subcontracts)
    end

    def franchises_contracts
    	@contracts = Contract.where('is_franchised = ?', true).where('is_extended != ?', true).where('is_bought_out != ?', true).includes(:subcontracts)
    end

    def both_contracts
    	@contracts = Contract.where('is_extended = ?', true).where('is_franchised = ?', true ).where('is_bought_out != ?', true).includes(:subcontracts)
    end

     def dead_money_contracts
        @contracts = Contract.where('is_dead_money = ?', true)
    end
end
