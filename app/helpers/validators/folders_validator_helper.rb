# frozen_string_literal: true

module Validators
  module FoldersValidatorHelper
    WORKSPACE_NOT_PRESENT = I18n.t error.folder.workspace.not_present

    def validate_title_not_nil
      folder.title ||= ''
    end

    def validate_workspace_presence
      folder.error[:base] << WORKSPACE_NOT_PRESENT unless folder.workspace
    end
  end
end
