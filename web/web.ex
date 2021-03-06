defmodule Constable.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use MyApp.Web, :controller
      use MyApp.Web, :view

  Keep the definitions in this module short and clean,
  mostly focused on imports, uses and aliases.
  """

  def view do
    quote do
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]
      import Constable.Router.Helpers
      import Constable.ErrorHelpers
      import Constable.Gettext
      import Constable.SharedView
      import Constable.EnumHelper

      use Phoenix.HTML
      use Phoenix.View, root: "web/templates"

      alias Constable.Repo
    end
  end

  def controller do
    quote do
      use Phoenix.Controller

      import Constable.Router.Helpers
      import Ecto.Query
      import Ecto.Schema
      import Constable.Gettext
      import Constable.ControllerHelper

      alias Constable.Repo
    end
  end

  def model do
    quote do
      use Ecto.Schema
      import Ecto.Changeset
      import Ecto.Query
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
