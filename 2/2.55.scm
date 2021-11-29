; ''abracadabra is the equivalent of (quote (quote abracadabra)). Thus, we have
; the quoted expression (quote abracadabra), and car returns quote (which is
; not the quote procedure, but rather a symbol - the equivalent of evaluating
; 'quote).
