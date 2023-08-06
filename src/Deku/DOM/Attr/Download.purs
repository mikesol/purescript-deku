module Deku.DOM.Attr.Download where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Download = Download

instance Attr A_ Download (NonEmpty.NonEmpty Event.Event  String ) where
  attr Download bothValues = unsafeAttribute $ Both (pure 
    { key: "download", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "download", value: prop' value })
instance Attr A_ Download (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Download (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "download", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "download", value: prop' value })
instance Attr A_ Download  String  where
  attr Download value = unsafeAttribute $ This $ pure $
    { key: "download", value: prop' value }
instance Attr A_ Download (Event.Event  String ) where
  attr Download eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "download", value: prop' value }

instance Attr A_ Download (ST.ST Global.Global  String ) where
  attr Download iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "download", value: prop' value }

instance Attr Area_ Download (NonEmpty.NonEmpty Event.Event  String ) where
  attr Download bothValues = unsafeAttribute $ Both (pure 
    { key: "download", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "download", value: prop' value })
instance Attr Area_ Download (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Download (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "download", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "download", value: prop' value })
instance Attr Area_ Download  String  where
  attr Download value = unsafeAttribute $ This $ pure $
    { key: "download", value: prop' value }
instance Attr Area_ Download (Event.Event  String ) where
  attr Download eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "download", value: prop' value }

instance Attr Area_ Download (ST.ST Global.Global  String ) where
  attr Download iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "download", value: prop' value }

instance Attr everything Download (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Download bothValues = unsafeAttribute $ Both (pure 
    { key: "download", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "download", value: unset' })
instance Attr everything Download (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Download (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "download", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "download", value: unset' })
instance Attr everything Download  Unit  where
  attr Download _ = unsafeAttribute $ This $ pure $
    { key: "download", value: unset' }
instance Attr everything Download (Event.Event  Unit ) where
  attr Download eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "download", value: unset' }

instance Attr everything Download (ST.ST Global.Global  Unit ) where
  attr Download iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "download", value: unset' }
