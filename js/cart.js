document.addEventListener("DOMContentLoaded", function () {
    // --- 1. MODAL CHECKOUT ---
    const checkoutBtn = document.querySelector(".checkout-btn");
    const checkoutOverlay = document.getElementById("checkout-overlay");
    const closeOverlay = document.querySelector(".close-overlay");

    if (checkoutBtn && checkoutOverlay) {
        checkoutBtn.addEventListener("click", function () {
            checkoutOverlay.classList.remove("hidden");
            checkoutOverlay.style.display = "flex";
        });
    }

    if (closeOverlay && checkoutOverlay) {
        closeOverlay.addEventListener("click", function () {
            checkoutOverlay.classList.add("hidden");
            checkoutOverlay.style.display = "none";
        });
    }

    // --- 2. FITUR HAPUS & QTY (EVENT DELEGATION) ---
    document.addEventListener("click", function (e) {
        // Deteksi Klik Tombol Hapus (Termasuk Icon Trash)
        const removeBtn = e.target.closest(".remove-btn");
        if (removeBtn) {
            e.preventDefault();
            const cartId = removeBtn.getAttribute("data-id");

            if (confirm("Apakah Anda yakin ingin menghapus produk ini dari keranjang?")) {
                deleteCartItem(cartId);
            }
            return;
        }

        // Deteksi Klik Tambah (+)
        const incBtn = e.target.closest(".quantity-btn.increment");
        if (incBtn) {
            const cartId = incBtn.getAttribute("data-id");
            const maxStock = parseInt(incBtn.getAttribute("data-stock"));
            const qtySpan = document.getElementById(`quantity-number-${cartId}`);
            let currentQty = parseInt(qtySpan.innerText);

            if (currentQty < maxStock) {
                updateQuantity(cartId, currentQty + 1);
            } else {
                alert("Jumlah melebihi stok yang tersedia!");
            }
            return;
        }

        // Deteksi Klik Kurang (-)
        const decBtn = e.target.closest(".quantity-btn.decrement");
        if (decBtn) {
            const cartId = decBtn.getAttribute("data-id");
            const qtySpan = document.getElementById(`quantity-number-${cartId}`);
            let currentQty = parseInt(qtySpan.innerText);

            if (currentQty > 1) {
                updateQuantity(cartId, currentQty - 1);
            }
            return;
        }
    });

    function deleteCartItem(cartId) {
        const formData = new FormData();
        formData.append("action", "remove");
        formData.append("cart_id", cartId);

        fetch("update_quantity.php", {
            method: "POST",
            body: formData,
        })
            .then((res) => res.json())
            .then((data) => {
                if (data.success) {
                    location.reload();
                } else {
                    alert("Gagal menghapus produk.");
                }
            })
            .catch((err) => console.error(err));
    }

    function updateQuantity(cartId, newQty) {
        const formData = new FormData();
        formData.append("action", "update");
        formData.append("cart_id", cartId);
        formData.append("quantity", newQty);

        fetch("update_quantity.php", {
            method: "POST",
            body: formData,
        })
            .then((res) => res.json())
            .then((data) => {
                if (data.success) {
                    location.reload();
                } else {
                    alert("Gagal memperbarui jumlah produk.");
                }
            })
            .catch((err) => console.error(err));
    }
});