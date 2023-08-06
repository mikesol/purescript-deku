module Deku.DOM.Attr.Allow where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Allow = Allow

instance Attr Iframe_ Allow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Allow bothValues = unsafeAttribute $ Both (pure 
    { key: "allow", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "allow", value: prop' value })
instance Attr Iframe_ Allow (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Allow (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "allow", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "allow", value: prop' value })
instance Attr Iframe_ Allow  String  where
  attr Allow value = unsafeAttribute $ This $ pure $
    { key: "allow", value: prop' value }
instance Attr Iframe_ Allow (Event.Event  String ) where
  attr Allow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "allow", value: prop' value }

instance Attr Iframe_ Allow (ST.ST Global.Global  String ) where
  attr Allow iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "allow", value: prop' value }

instance Attr everything Allow (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Allow bothValues = unsafeAttribute $ Both (pure  { key: "allow", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "allow", value: unset' })
instance Attr everything Allow (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Allow (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "allow", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "allow", value: unset' })
instance Attr everything Allow  Unit  where
  attr Allow _ = unsafeAttribute $ This $ { key: "allow", value: unset' }
instance Attr everything Allow (Event.Event  Unit ) where
  attr Allow eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "allow", value: unset' }

instance Attr everything Allow (ST.ST Global.Global  Unit ) where
  attr Allow iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "allow", value: unset' }
