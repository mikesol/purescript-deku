module Deku.DOM.Attr.Start where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Ol (Ol_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Start = Start

instance Attr Ol_ Start (NonEmpty.NonEmpty Event.Event  String ) where
  attr Start bothValues = unsafeAttribute $ Both (pure 
    { key: "start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "start", value: prop' value })
instance Attr Ol_ Start (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Start (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "start", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "start", value: prop' value })
instance Attr Ol_ Start  String  where
  attr Start value = unsafeAttribute $ This $ pure $
    { key: "start", value: prop' value }
instance Attr Ol_ Start (Event.Event  String ) where
  attr Start eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "start", value: prop' value }

instance Attr Ol_ Start (ST.ST Global.Global  String ) where
  attr Start stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "start", value: prop' value }

instance Attr everything Start (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Start bothValues = unsafeAttribute $ Both (pure  { key: "start", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "start", value: unset' })
instance Attr everything Start (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Start (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "start", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "start", value: unset' })
instance Attr everything Start  Unit  where
  attr Start _ = unsafeAttribute $ This $ pure $ { key: "start", value: unset' }
instance Attr everything Start (Event.Event  Unit ) where
  attr Start eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "start", value: unset' }

instance Attr everything Start (ST.ST Global.Global  Unit ) where
  attr Start stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "start", value: unset' }
