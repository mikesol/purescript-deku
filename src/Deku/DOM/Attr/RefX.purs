module Deku.DOM.Attr.RefX where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RefX = RefX

instance Attr Marker_ RefX (NonEmpty.NonEmpty Event.Event  String ) where
  attr RefX bothValues = unsafeAttribute $ Both (pure 
    { key: "refX", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "refX", value: prop' value })
instance Attr Marker_ RefX (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RefX (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "refX", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "refX", value: prop' value })
instance Attr Marker_ RefX  String  where
  attr RefX value = unsafeAttribute $ This $ pure $
    { key: "refX", value: prop' value }
instance Attr Marker_ RefX (Event.Event  String ) where
  attr RefX eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "refX", value: prop' value }

instance Attr Marker_ RefX (ST.ST Global.Global  String ) where
  attr RefX stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "refX", value: prop' value }

instance Attr Symbol_ RefX (NonEmpty.NonEmpty Event.Event  String ) where
  attr RefX bothValues = unsafeAttribute $ Both (pure 
    { key: "refX", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "refX", value: prop' value })
instance Attr Symbol_ RefX (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RefX (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "refX", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "refX", value: prop' value })
instance Attr Symbol_ RefX  String  where
  attr RefX value = unsafeAttribute $ This $ pure $
    { key: "refX", value: prop' value }
instance Attr Symbol_ RefX (Event.Event  String ) where
  attr RefX eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "refX", value: prop' value }

instance Attr Symbol_ RefX (ST.ST Global.Global  String ) where
  attr RefX stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "refX", value: prop' value }

instance Attr everything RefX (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr RefX bothValues = unsafeAttribute $ Both (pure  { key: "refX", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "refX", value: unset' })
instance Attr everything RefX (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr RefX (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "refX", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "refX", value: unset' })
instance Attr everything RefX  Unit  where
  attr RefX _ = unsafeAttribute $ This $ pure $ { key: "refX", value: unset' }
instance Attr everything RefX (Event.Event  Unit ) where
  attr RefX eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "refX", value: unset' }

instance Attr everything RefX (ST.ST Global.Global  Unit ) where
  attr RefX stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "refX", value: unset' }
