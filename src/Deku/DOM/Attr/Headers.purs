module Deku.DOM.Attr.Headers where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Headers = Headers

instance Attr Td_ Headers (NonEmpty.NonEmpty Event.Event  String ) where
  attr Headers bothValues = unsafeAttribute $ Both (pure 
    { key: "headers", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "headers", value: prop' value })
instance Attr Td_ Headers (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Headers (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "headers", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "headers", value: prop' value })
instance Attr Td_ Headers  String  where
  attr Headers value = unsafeAttribute $ This $ pure $
    { key: "headers", value: prop' value }
instance Attr Td_ Headers (Event.Event  String ) where
  attr Headers eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "headers", value: prop' value }

instance Attr Td_ Headers (ST.ST Global.Global  String ) where
  attr Headers stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "headers", value: prop' value }

instance Attr Th_ Headers (NonEmpty.NonEmpty Event.Event  String ) where
  attr Headers bothValues = unsafeAttribute $ Both (pure 
    { key: "headers", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "headers", value: prop' value })
instance Attr Th_ Headers (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Headers (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "headers", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "headers", value: prop' value })
instance Attr Th_ Headers  String  where
  attr Headers value = unsafeAttribute $ This $ pure $
    { key: "headers", value: prop' value }
instance Attr Th_ Headers (Event.Event  String ) where
  attr Headers eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "headers", value: prop' value }

instance Attr Th_ Headers (ST.ST Global.Global  String ) where
  attr Headers stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "headers", value: prop' value }

instance Attr everything Headers (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Headers bothValues = unsafeAttribute $ Both (pure 
    { key: "headers", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "headers", value: unset' })
instance Attr everything Headers (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Headers (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "headers", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "headers", value: unset' })
instance Attr everything Headers  Unit  where
  attr Headers _ = unsafeAttribute $ This $ pure $ { key: "headers", value: unset' }
instance Attr everything Headers (Event.Event  Unit ) where
  attr Headers eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "headers", value: unset' }

instance Attr everything Headers (ST.ST Global.Global  Unit ) where
  attr Headers stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "headers", value: unset' }
