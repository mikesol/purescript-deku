module Deku.DOM.Attr.Coords where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Coords = Coords

instance Attr Area_ Coords (NonEmpty.NonEmpty Event.Event  String ) where
  attr Coords bothValues = unsafeAttribute $ Both (pure 
    { key: "coords", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "coords", value: prop' value })
instance Attr Area_ Coords (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Coords (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "coords", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "coords", value: prop' value })
instance Attr Area_ Coords  String  where
  attr Coords value = unsafeAttribute $ This $ pure $
    { key: "coords", value: prop' value }
instance Attr Area_ Coords (Event.Event  String ) where
  attr Coords eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "coords", value: prop' value }

instance Attr Area_ Coords (ST.ST Global.Global  String ) where
  attr Coords stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "coords", value: prop' value }

instance Attr everything Coords (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Coords bothValues = unsafeAttribute $ Both (pure 
    { key: "coords", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "coords", value: unset' })
instance Attr everything Coords (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Coords (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "coords", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "coords", value: unset' })
instance Attr everything Coords  Unit  where
  attr Coords _ = unsafeAttribute $ This $ pure $ { key: "coords", value: unset' }
instance Attr everything Coords (Event.Event  Unit ) where
  attr Coords eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "coords", value: unset' }

instance Attr everything Coords (ST.ST Global.Global  Unit ) where
  attr Coords stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "coords", value: unset' }
