defmodule PosApp.InventoryTest do
  use PosApp.DataCase

  alias PosApp.Inventory

  describe "products" do
    alias PosApp.Inventory.Product

    import PosApp.InventoryFixtures

    @invalid_attrs %{name: nil, description: nil, price: nil, stock: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Inventory.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Inventory.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{name: "some name", description: "some description", price: "120.5", stock: 42}

      assert {:ok, %Product{} = product} = Inventory.create_product(valid_attrs)
      assert product.name == "some name"
      assert product.description == "some description"
      assert product.price == Decimal.new("120.5")
      assert product.stock == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", price: "456.7", stock: 43}

      assert {:ok, %Product{} = product} = Inventory.update_product(product, update_attrs)
      assert product.name == "some updated name"
      assert product.description == "some updated description"
      assert product.price == Decimal.new("456.7")
      assert product.stock == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_product(product, @invalid_attrs)
      assert product == Inventory.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Inventory.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Inventory.change_product(product)
    end
  end
end
