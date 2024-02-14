import yfinance as yf
# Download historical data for a stock
msft = yf.Ticker("AMD")
msft_data = msft.history(period="max")
# Display the downloaded data
print(msft_data.head())
