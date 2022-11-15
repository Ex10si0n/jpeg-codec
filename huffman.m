function [bit_stream, dict] = huffman(input_stream, mode, saved_dict)
	if mode == "en"
		[unique_symbols, ~, symbol_indices] = unique(input_stream);
		symbol_counts = accumarray(symbol_indices(:), 1);
		symbol_counts = symbol_counts / sum(symbol_counts);
		dict = huffmandict(unique_symbols, symbol_counts);
		bit_stream = huffmanenco(input_stream, dict);
	end
	if mode == "de"
		bit_stream = huffmandeco(input_stream, saved_dict);
    end
end