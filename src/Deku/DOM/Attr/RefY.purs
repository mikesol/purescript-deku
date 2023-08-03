module Deku.DOM.Attr.RefY where

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

data RefY = RefY

instance Attr Marker_ RefY (NonEmpty.NonEmpty Event.Event  String ) where
  attr RefY bothValues = unsafeAttribute $ Both (pure 
    { key: "refY", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "refY", value: prop' value })
instance Attr Marker_ RefY (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RefY (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "refY", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "refY", value: prop' value })
instance Attr Marker_ RefY  String  where
  attr RefY value = unsafeAttribute $ This $ pure $
    { key: "refY", value: prop' value }
instance Attr Marker_ RefY (Event.Event  String ) where
  attr RefY eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "refY", value: prop' value }

instance Attr Marker_ RefY (ST.ST Global.Global  String ) where
  attr RefY stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "refY", value: prop' value }

instance Attr Symbol_ RefY (NonEmpty.NonEmpty Event.Event  String ) where
  attr RefY bothValues = unsafeAttribute $ Both (pure 
    { key: "refY", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "refY", value: prop' value })
instance Attr Symbol_ RefY (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RefY (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "refY", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "refY", value: prop' value })
instance Attr Symbol_ RefY  String  where
  attr RefY value = unsafeAttribute $ This $ pure $
    { key: "refY", value: prop' value }
instance Attr Symbol_ RefY (Event.Event  String ) where
  attr RefY eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "refY", value: prop' value }

instance Attr Symbol_ RefY (ST.ST Global.Global  String ) where
  attr RefY stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "refY", value: prop' value }

instance Attr everything RefY (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr RefY bothValues = unsafeAttribute $ Both (pure  { key: "refY", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "refY", value: unset' })
instance Attr everything RefY (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr RefY (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "refY", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "refY", value: unset' })
instance Attr everything RefY  Unit  where
  attr RefY _ = unsafeAttribute $ This $ pure $ { key: "refY", value: unset' }
instance Attr everything RefY (Event.Event  Unit ) where
  attr RefY eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "refY", value: unset' }

instance Attr everything RefY (ST.ST Global.Global  Unit ) where
  attr RefY stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "refY", value: unset' }
