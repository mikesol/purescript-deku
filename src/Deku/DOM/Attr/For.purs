module Deku.DOM.Attr.For where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Label (Label_)
import Deku.DOM.Elt.Output (Output_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data For = For

instance Attr Label_ For (NonEmpty.NonEmpty Event.Event  String ) where
  attr For bothValues = unsafeAttribute $ Both (pure 
    { key: "for", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "for", value: prop' value })
instance Attr Label_ For (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr For (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "for", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "for", value: prop' value })
instance Attr Label_ For  String  where
  attr For value = unsafeAttribute $ This $ { key: "for", value: prop' value }
instance Attr Label_ For (Event.Event  String ) where
  attr For eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "for", value: prop' value }

instance Attr Label_ For (ST.ST Global.Global  String ) where
  attr For iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "for", value: prop' value }

instance Attr Output_ For (NonEmpty.NonEmpty Event.Event  String ) where
  attr For bothValues = unsafeAttribute $ Both (pure 
    { key: "for", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "for", value: prop' value })
instance Attr Output_ For (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr For (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "for", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "for", value: prop' value })
instance Attr Output_ For  String  where
  attr For value = unsafeAttribute $ This $ { key: "for", value: prop' value }
instance Attr Output_ For (Event.Event  String ) where
  attr For eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "for", value: prop' value }

instance Attr Output_ For (ST.ST Global.Global  String ) where
  attr For iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "for", value: prop' value }

instance Attr everything For (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr For bothValues = unsafeAttribute $ Both (pure  { key: "for", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "for", value: unset' })
instance Attr everything For (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr For (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "for", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "for", value: unset' })
instance Attr everything For  Unit  where
  attr For _ = unsafeAttribute $ This $ { key: "for", value: unset' }
instance Attr everything For (Event.Event  Unit ) where
  attr For eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "for", value: unset' }

instance Attr everything For (ST.ST Global.Global  Unit ) where
  attr For iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "for", value: unset' }
