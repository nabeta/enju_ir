module EnjuIr
  class DatasetPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
end
