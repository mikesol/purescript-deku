module Deku.DOM.Attr.ViewBox where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ViewBox = ViewBox

instance Attr Marker_ ViewBox (NonEmpty.NonEmpty Event.Event  String ) where
  attr ViewBox bothValues = unsafeAttribute $ Both (pure 
    { key: "viewBox", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "viewBox", value: prop' value })
instance Attr Marker_ ViewBox (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ViewBox (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "viewBox", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "viewBox", value: prop' value })
instance Attr Marker_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute $ This $ pure $
    { key: "viewBox", value: prop' value }
instance Attr Marker_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }

instance Attr Marker_ ViewBox (ST.ST Global.Global  String ) where
  attr ViewBox iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "viewBox", value: prop' value }

instance Attr Pattern_ ViewBox (NonEmpty.NonEmpty Event.Event  String ) where
  attr ViewBox bothValues = unsafeAttribute $ Both (pure 
    { key: "viewBox", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "viewBox", value: prop' value })
instance Attr Pattern_ ViewBox (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ViewBox (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "viewBox", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "viewBox", value: prop' value })
instance Attr Pattern_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute $ This $ pure $
    { key: "viewBox", value: prop' value }
instance Attr Pattern_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }

instance Attr Pattern_ ViewBox (ST.ST Global.Global  String ) where
  attr ViewBox iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "viewBox", value: prop' value }

instance Attr Svg_ ViewBox (NonEmpty.NonEmpty Event.Event  String ) where
  attr ViewBox bothValues = unsafeAttribute $ Both (pure 
    { key: "viewBox", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "viewBox", value: prop' value })
instance Attr Svg_ ViewBox (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ViewBox (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "viewBox", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "viewBox", value: prop' value })
instance Attr Svg_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute $ This $ pure $
    { key: "viewBox", value: prop' value }
instance Attr Svg_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }

instance Attr Svg_ ViewBox (ST.ST Global.Global  String ) where
  attr ViewBox iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "viewBox", value: prop' value }

instance Attr Symbol_ ViewBox (NonEmpty.NonEmpty Event.Event  String ) where
  attr ViewBox bothValues = unsafeAttribute $ Both (pure 
    { key: "viewBox", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "viewBox", value: prop' value })
instance Attr Symbol_ ViewBox (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ViewBox (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "viewBox", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "viewBox", value: prop' value })
instance Attr Symbol_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute $ This $ pure $
    { key: "viewBox", value: prop' value }
instance Attr Symbol_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }

instance Attr Symbol_ ViewBox (ST.ST Global.Global  String ) where
  attr ViewBox iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "viewBox", value: prop' value }

instance Attr View_ ViewBox (NonEmpty.NonEmpty Event.Event  String ) where
  attr ViewBox bothValues = unsafeAttribute $ Both (pure 
    { key: "viewBox", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "viewBox", value: prop' value })
instance Attr View_ ViewBox (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ViewBox (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "viewBox", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "viewBox", value: prop' value })
instance Attr View_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute $ This $ pure $
    { key: "viewBox", value: prop' value }
instance Attr View_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }

instance Attr View_ ViewBox (ST.ST Global.Global  String ) where
  attr ViewBox iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "viewBox", value: prop' value }

instance Attr everything ViewBox (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr ViewBox bothValues = unsafeAttribute $ Both (pure 
    { key: "viewBox", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "viewBox", value: unset' })
instance Attr everything ViewBox (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr ViewBox (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "viewBox", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "viewBox", value: unset' })
instance Attr everything ViewBox  Unit  where
  attr ViewBox _ = unsafeAttribute $ This $ { key: "viewBox", value: unset' }
instance Attr everything ViewBox (Event.Event  Unit ) where
  attr ViewBox eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "viewBox", value: unset' }

instance Attr everything ViewBox (ST.ST Global.Global  Unit ) where
  attr ViewBox iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "viewBox", value: unset' }
