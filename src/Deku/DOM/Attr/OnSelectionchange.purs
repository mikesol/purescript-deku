module Deku.DOM.Attr.OnSelectionchange where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnSelectionchange = OnSelectionchange

instance Attr anything OnSelectionchange (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSelectionchange bothValues = unsafeAttribute $ Both (pure 
    { key: "selectionchange", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "selectionchange", value: cb' value })
instance Attr anything OnSelectionchange (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnSelectionchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "selectionchange", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "selectionchange", value: cb' value })
instance Attr anything OnSelectionchange  Cb  where
  attr OnSelectionchange value = unsafeAttribute $ This $ pure $
    { key: "selectionchange", value: cb' value }
instance Attr anything OnSelectionchange (Event.Event  Cb ) where
  attr OnSelectionchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "selectionchange", value: cb' value }

instance Attr anything OnSelectionchange (ST.ST Global.Global  Cb ) where
  attr OnSelectionchange iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "selectionchange", value: cb' value }

instance Attr anything OnSelectionchange (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSelectionchange bothValues = unsafeAttribute $ Both (pure 
    { key: "selectionchange"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "selectionchange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSelectionchange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnSelectionchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "selectionchange"
    , value: cb' (Cb (const ((value) $> true)))
    })
    ( Tuple.snd bothValues <#> \value ->
        { key: "selectionchange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSelectionchange  (Effect Unit)  where
  attr OnSelectionchange value = unsafeAttribute $ This $ pure $
    { key: "selectionchange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelectionchange (Event.Event  (Effect Unit) ) where
  attr OnSelectionchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "selectionchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelectionchange (ST.ST Global.Global  (Effect Unit) ) where
  attr OnSelectionchange iValue = unsafeAttribute $ This $ iValue
    <#> \value ->
      { key: "selectionchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelectionchange (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSelectionchange bothValues = unsafeAttribute $ Both (pure 
    { key: "selectionchange", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "selectionchange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSelectionchange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnSelectionchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "selectionchange", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "selectionchange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSelectionchange  (Effect Boolean)  where
  attr OnSelectionchange value = unsafeAttribute $ This $ pure $
    { key: "selectionchange", value: cb' (Cb (const value)) }
instance Attr anything OnSelectionchange (Event.Event  (Effect Boolean) ) where
  attr OnSelectionchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "selectionchange", value: cb' (Cb (const value)) }

instance Attr anything OnSelectionchange (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnSelectionchange iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "selectionchange", value: cb' (Cb (const value)) }

instance Attr everything OnSelectionchange (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSelectionchange bothValues = unsafeAttribute $ Both (pure 
    { key: "selectionchange", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "selectionchange", value: unset' })
instance Attr everything OnSelectionchange (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnSelectionchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "selectionchange", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "selectionchange", value: unset' })
instance Attr everything OnSelectionchange  Unit  where
  attr OnSelectionchange _ = unsafeAttribute $ This $ pure $
    { key: "selectionchange", value: unset' }
instance Attr everything OnSelectionchange (Event.Event  Unit ) where
  attr OnSelectionchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "selectionchange", value: unset' }

instance Attr everything OnSelectionchange (ST.ST Global.Global  Unit ) where
  attr OnSelectionchange iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "selectionchange", value: unset' }
